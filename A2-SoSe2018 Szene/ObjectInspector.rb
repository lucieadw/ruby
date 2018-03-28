require 'tk'
require './Einstellungen'

# Author::    Birgit Wendholt 
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

class ObjectInspector < TkToplevel

  
  def initialize(parent,object_to_inspect,*args)
    super(parent,args)
    @parent = parent
    @object_to_inspect = object_to_inspect
    show_me()
  end
  
  def show_me()
      
    # Ein Label für das zu inspizierende Objekt
    label_text = "#@object_to_inspect:#{@object_to_inspect.class} Instanzvariablen"
    Tk::Tile::Label.new(self) { 
      text label_text }.grid(:row => 0, 
      :column => 0, 
      :columnspan => 2, 
      :pady => 5,
      :padx => $PADX)
           
    row = zeige_instanz_variablen(1)

    # Ein Label für die Klassenvariablen des zu inspizierenden Objektes 
    label_text = "#@object_to_inspect: Klassenvariablen"
    Tk::Tile::Label.new(self) { 
      text label_text }.grid(:row => row, 
      :column => 0, 
      :columnspan => 2, 
      :pady => 5, :padx => $PADX)
    
    row = zeige_klassen_variablen(row+1)
    
    # Button für das Schließen des Fensters
    Tk::Tile::Button.new(button_parent=self) { 
        text $BYE
        command proc {button_parent.destroy}
    }.grid(:row => row, :column  => 0, :sticky => 'w', :pady => 5, :padx => $PADX )        
 end
 
  def zeige_instanz_variablen(row)
    # die Instanzvariablen
    instance_vars = @object_to_inspect.instance_variables()
    # Tabelle, in der zu jeder Instanzvariablen die Werte der Variable eingetragen werden
    var_value_tabelle = Hash.new()
    # trägt zu jeder Instanzvariablen den Wert in die Tabelle var_value_tabelle ein
    instance_vars.each { |var| 
      var_value_tabelle[var]= @object_to_inspect.instance_variable_get(var) 
    }
     return zeige_variablen_und_werte(var_value_tabelle,row)
  end  
  
  def zeige_klassen_variablen(row)
    class_vars = @object_to_inspect.class.class_variables()
    var_value_tabelle = {}
    class_vars.each do |cv |
      var_value_tabelle[cv] =  @object_to_inspect.class.class_variable_get(cv)
    end
    return zeige_variablen_und_werte(var_value_tabelle,row)
   end
  
  def zeige_variablen_und_werte(var_value_map,row)
      var_value_map.each_pair() do |var, value|
        Tk::Tile::Label.new(self) { text var }.grid(:row => row, :column => 0, :sticky => "w", :padx => $PADX)        
        entry_value = TkVariable.new(value)
        tile = Tk::Tile::Entry.new(self){ 
             textvariable  entry_value
             state :readonly
             }.grid(:row => row, :column => 1, :padx => $PADX)
        # fuege ein Menu hinzu um Inspektoren kaskadierend zu öffnen
        add_inspector_menu(tile,value)
        row +=1
      end
    return row+1
  end
  
  def add_inspector_menu(tile,value)
    tile_menu = TkMenu.new(tile)
    tile_menu.add(:command,
      :label => $INSPECTOR,
      :command => proc do
        inspector = ObjectInspector.new(@parent, value){ 
           title $INSPECTOR
        }
      end 
    )
    if Tk.windowingsystem == 'aqua'
       tile.bind '2', proc{|x,y| tile_menu.popup(x,y)}, "%X %Y"
       tile.bind 'Control-1', proc{|x,y| tile_menu.popup(x,y)}, "%X %Y"
    else
       tile.bind '3', proc{|x,y| tile_menu.popup(x,y)}, "%X %Y"
    end                 
  end
end