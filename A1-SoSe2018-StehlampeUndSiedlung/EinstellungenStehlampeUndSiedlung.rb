$TOOLBOXTITLE = 'Stehlampe'
$CLASSES = [ :StehLampe, :Haus, :Siedlung ]

#
# Konfiguration der Objektmethoden von StehLampe
#
$METHOD_CONFIG = {
  :StehLampe => {
  :sichtbar_machen => { :label => :sichtbar_machen },
  :vertikal_bewegen => { :label => :'vertikal_bewegen(...)' , :args => [ [:'anzahl_punkte', :Integer] ] },
  :horizontal_bewegen => { :label => :'horizontal_bewegen(...)' , :args => [ [:'anzahl_punkte', :Integer] ] },
  :bewegen => { :label => :'bewegen(...)' ,
  :args => [
  [:'x_delta', :Integer],
  [:'y_delta', :Integer],
  [:'wiederholungen', :Integer],
  [:'wiederholen_nach [ms]', :Integer],
  [:'starten_nach [ms]', :Integer]] },
  # :position Name der Methode im Quelltext
  # :label => 'position() Name der Methode im Kontextmenu des Objektes
  # :ergebnis => Point Methode, die ein Ergebnis liefert hier wird ein Point Objekt zurückgegeben
  :position => {:label => :position, :ergebnis => :Point},
  :auf_position_setzen => { :label => :'auf_position_setzen(...)' , :args => [ [:'pos_x', :Integer], [:'pos_y', :Integer] ] },
  # :leucht_farbe_aendern Name der Methode im Quelltext
  # :label => 'leucht_farbe_aendern(...) Name der Methode im Kontextmenu des Objektes
  # :args => [ [:neue_:farbe , :String]] Parameter der Methode (> 1 Parameter möglich)
  :leucht_farbe_aendern => { :label => 'leucht_farbe_aendern(...)', :args => [ [:'neue_farbe', :String] ]},
  :einschalten => { :label => :einschalten},
  :ausschalten => { :label => :ausschalten }
  },
  :Haus => {
   :sichtbar_machen => {:label => :'sichtbar_machen()'},
   :auf_position_setzen => { :label => :'auf_position_setzen(...)' , :args => [ [:'pos_x', :Integer], [:'pos_y', :Integer] ] },
   :position => {:label => :position, :ergebnis => :Point},
   :tages_ansicht => {:label => :'tages_ansicht()'},
   :nacht_ansicht => {:label => :'nacht_ansicht()'},
  },
  :Siedlung => {
    :sichtbar_machen => {:label => :'sichtbar_machen()'}
  },
  # Konfiguration der Klassenmethoden von StehLampe
  :StehLampe_class => {
  :new => { :label => :'new()' },
  },
  :Haus_class => {
  :new => { :label => :'new(...)', :args => [[:dach_farbe , :String]]}
  },
  :Siedlung_class => {
  :new => { :label => :'new()'},
  },
}
