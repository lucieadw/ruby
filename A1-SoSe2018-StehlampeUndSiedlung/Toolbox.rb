require 'tk'
require './ObjectInspector'
require './Einstellungen'
require './Leinwand'

# Author::    Birgit Wendholt 
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

class Toolbox 
  
  def initialize()
    @instanzen = []
    @klassen = $CLASSES
    @instanzen_menus = {}
    show_me()
  end
     
  :private
  def show_me() 
      @root = TkRoot.new do
        title($TOOLBOXTITLE)
      end 
      TkOption.add '*tearOff', 0
      add_menu_leiste()
      content = TkFrame.new(@root){
          height 300
          width 400}.grid(:row => 0, :column => 0, :sticky => "nswe") 
      TkGrid.columnconfigure( @root, 0, :weight => 1 )
      TkGrid.rowconfigure( @root, 0, :weight => 1 )
      add_instanzen_liste(content)
      add_zeichenflaeche(content)           
      TkGrid.columnconfigure( content, 0, :weight => 1 )
      TkGrid.columnconfigure( content, 2, :weight => 3 )
      TkGrid.rowconfigure( content, 1, :weight => 3 )
      Tk.mainloop
   end

  # Definiert die Menüleiste mit dem Dateimenü
  # und dem Menü für das Erzeugen von Objekten   
  def add_menu_leiste() 
    
    menubar = TkMenu.new(@root)
    @root['menu'] = menubar
    
    datei_menu = TkMenu.new(menubar)
    klassen_menu = TkMenu.new(menubar)
    menubar.add :cascade, :menu => datei_menu, :label => 'Datei'
    menubar.add :cascade, :menu => klassen_menu, :label => $CLASSMENU
  
    datei_menu.add('command',
       :label => 'Beenden',
       :command => proc { exit },
       :underline => 0,
       :accel => 'Ctrl+Q')
    @root.bind('Control-q', proc { exit })
  
    @klassen.each do |klassen_symbol|
        klassen_menu.add('command',
          :label => "#{klassen_symbol}.new()",
          :command => proc do
          klasse =  Kernel.const_get(klassen_symbol)
          method = :new
          method_config = $METHOD_CONFIG["#{klassen_symbol}_class".to_sym][method] 
          if (method_config.has_key?(:args))
              methoden_dialog( klasse, "#{klassen_symbol}_class".to_sym, method )
          elsif 
            instanz_hinzufuegen(klasse.method(method).call())
          end
          end,
          :underline => 0
        )               
       end       
  end

  
    # Zeigt die Instanzen der Figurenklassen in einer Liste an 
    # Für die Instanzen wird ein Popupmenu definiert, dass die Methoden der 
    # Instanzen enthält
    
    def add_instanzen_liste(root)
      
      TkLabel.new(root){text $INSTANCES }.grid(:row => 0, :column => 0, :sticky => "nwe") 
    
      @instanzen_listbox = TkListbox.new(root).grid(:row => 1, :column => 0, :sticky => "nwse")

      @instanzen_listbox.bind '<ListboxSelect>', proc{
        if (@instanzen_listbox.size > 0)        
          klasse =  @instanzen[ (@instanzen_listbox.curselection()[0])].class
          get_instanzen_menu(klasse)
          @instanzen_menus[klasse.to_s.to_sym]
        end
      }
      scrollbar = Tk::Tile::Scrollbar.new(root) {orient 'vertical'}.grid( :row=>1, :column => 1,  :sticky => 'ns')
      @instanzen_listbox.yscrollbar(scrollbar)
    end
    
    def get_instanzen_menu(klasse)
      klasse_symbol = klasse.to_s.to_sym
      if not @instanzen_menus.has_key?(klasse)
         menu = TkMenu.new(@instanzen_listbox)
         menu.add(:command,
           :label => "#{$METHODS} für #{klasse_symbol}")
         menu.add(:separator)
         $METHOD_CONFIG[ klasse_symbol ].each_pair { |method_name, method_config|
           menu.add(:command,
             :label => method_config[ :label],
             :command => proc { 
               instanz = @instanzen[ @instanzen_listbox.curselection()[0]]
               if !(instanz.respond_to?(method_name))
                 Tk::messageBox(
                       :icon => :error,
                       :message => " OOPS #{instanz.class}.#{method_config[:label]} muss noch implementiert werden ", 
                       :title => "ES GIBT WAS ZU TUN"
                 )                  
               else
                 if(method_config.has_key?(:ergebnis) )
                   ergebnis = instanz.method(method_name).call()
                   Tk::messageBox(
                     :message => " #{instanz}'s #{method_name} :: #{ergebnis}  ", 
                     :title => "Methodenergebnis #{method_name}"
                     )
                 elsif (method_config.has_key?(:args))
                     methoden_dialog(instanz,instanz.class.to_s.to_sym, method_name)
                 else
                   instanz.method(method_name).call()
                 end
               end
             }
           )
         }
         menu.add(:separator)
         menu.add(:command,
          :label => $INSPECTOR,
          :command => proc { inspector = ObjectInspector.new(@root, @instanzen[@instanzen_listbox.curselection()[0]]){ 
            title $INSPECTOR
          }})
          @instanzen_menus[klasse] = menu
      end
      bind_popup(@instanzen_menus[klasse])
      return @instanzen_menus[klasse]
    end
      
   def bind_popup(menu)
     if Tk.windowingsystem == 'aqua'
        @instanzen_listbox.bind '2', proc{|x,y| menu.popup(x,y)}, "%X %Y"
        @instanzen_listbox.bind 'Control-1', proc{|x,y| menu.popup(x,y)}, "%X %Y"
     else
        @instanzen_listbox.bind '3', proc{|x,y| menu.popup(x,y)}, "%X %Y"
     end     
   end   

    # Fügt eine Leinwand  als Zeichenfläche für Figureninstanzen ein
    def add_zeichenflaeche(parent)
      
      TkLabel.new(parent){text  "Leinwand"}.grid(:column => 2, :row => 0)
      @leinwand = Leinwand.gib_einzige_instanz(parent) do
        bg  $BACKGROUND_COLOR
        bd  0 
      end.grid(:column => 2, :row => 1, :sticky => "nsew")      
    end  
   
    # Ruft einen Dialog für das Eintragen der Methodenparameter auf
    def methoden_dialog(instanz, instanz_symbol, methoden_name)
       if !(instanz.respond_to?(methoden_name))
         Tk::messageBox(
               :icon => :error,
               :message => " OOPS METHODE #{instanz.class}.#{methoden_name} muss noch implementiert werden ", 
               :title => "ES GIBT WAS ZU TUN"
         )
       else
         dialog = TkMethodenDialog.new(@root,self,instanz, instanz_symbol, methoden_name) {
         title methoden_name 
         minsize(methoden_name.size()*2.round(),60)
         }
         dialog.grab()
       end
    end
    
    def instanz_hinzufuegen(instanz)
      @instanzen << instanz    
      @instanzen_listbox.insert(:end, @instanzen.last().intern_to_s)       
    end
        
    def instanzen_liste(klasse)
      instanzen_der_klasse = []
      @instanzen.each{ |obj| if (obj.is_a?(klasse)) 
          instanzen_der_klasse << obj end  }    
      return instanzen_der_klasse  
    end
    
    def klassen
      @klassen.clone()
    end
end


# Ein Eingabedialog für die Eingabe eines Wertes
class TkMethodenDialog < TkToplevel
  $OK = 'Ok'
  $CANCEL = 'Abbrechen'
  
  def initialize(parent,toolbox, instanz, instanz_symbol, methoden_name, &block)
      super(parent, &block)
      entries = []
      row = 0
      my_parent = self
      instanzen_liste = []
      labels_and_types = $METHOD_CONFIG[instanz_symbol][methoden_name][ :args]
      labels_and_types.each do |label_and_type|
         label_name = label_and_type[0]
         type = label_and_type[1]
         Tk::Tile::Label.new(self) {text label_name}.grid(:column => 0, :row => row, :sticky => "nswe")
         entry_var = TkVariable.new(instanz)        
         if toolbox.klassen.include?(type)
           instanzen_liste = toolbox.instanzen_liste(Kernel.const_get(type))     
           entry =  Tk::Tile::Combobox.new(self) {
             state :readonly
            }.grid(:column => 0, :row => row)
           entry.values(instanzen_liste) 
         else
           entry = Tk::Tile::Entry.new(self).grid( :column => 1, :row => row)             
         end
         entries << entry
         row +=1   
      end      
      Tk::Tile::Button.new(self) {text $OK
               command proc { 
                   entry_vals  = [];
                   i = 0;
                   entries.each_index{|index|
                     entry = entries[index]
                     type = labels_and_types[index][1] 
                     if type == :String
                       entry_vals << entry.get() 
                     elsif type == :Integer
                       entry_vals << Integer(entry.get()) 
                     elsif type == :Float
                       entry_vals << Float(entry.get())
                     else 
                       if (entry.current()) >= 0
                          entry_vals << instanzen_liste[entry.current()]
                       else entry_vals << nil
                       end
                     end}  
                     ein_objekt = instanz.method(methoden_name).call(*entry_vals)
                     if (instanz.is_a? Class)
                         toolbox.instanz_hinzufuegen(ein_objekt)                       
                     end  
                     my_parent.destroy
                  } 
           }.grid(:column => 0, :row => row)
            Tk::Tile::Button.new(self) {text $CANCEL
               command proc { 
                   my_parent.destroy
                  } 
            }.grid(:column => 1, :row => row)
    end
    
end

Toolbox.new()


