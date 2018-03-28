$CLASSES = [:StrassenSzene, :Strasse, :Bus, :StrassenLaterne, :Haus]

#
# Methodenspezifikation fuer die Objekt- und Klassen-methoden der Klassen der Toolbox
#

$METHOD_CONFIG = {
    :StrassenSzene => {
        :sichtbar_machen => {:label => :sichtbar_machen},
        :animation => {:label => :animation},
        :reset_animation => {:label => :reset_animation},
        :clear => {:label => :clear}
    },
    :StrassenSzene_class => {
        :new => {:label => :'new()'},
    },
    :StrassenLaterne => {
        :sichtbar_machen => {:label => :sichtbar_machen},
        :position => {:label => :position, :ergebnis => :Point},
        :auf_position_setzen => {:label => :'auf_position_setzen(...)', :args => [[:x, :Integer], [:y, :Integer]]},
        :bewegen => {:label => :'bewegen(...)', :args => [[:'x_delta', :Integer], [:'y_delta', :Integer], [:'wiederholungen', :Integer], [:'wiederholen_nach [ms]', :Integer], [:'starten_nach [ms]', :Integer]]},
        :hoehe => {:label => :hoehe, :ergebnis => :Integer},
        :breite => {:label => :breite, :ergebnis => :Integer},
        :clear => {:label => :clear}
    },
    :StrassenLaterne_class => {
        :new => {:label => :'new()'}
    },
    :Haus => {
        :sichtbar_machen => {:label => :'sichtbar_machen()'},
        :position => {:label => :position, :ergebnis => :Point},
        :auf_position_setzen => {:label => :'auf_position_setzen(...)', :args => [[:'pos_x', :Integer], [:'pos_y', :Integer]]},
        :hoehe => {:label => :hoehe, :ergebnis => :Integer},
        :breite => {:label => :breite, :ergebnis => :Integer},
        :clear => {:label => :clear}
    },
    :Haus_class => {
        :new => {:label => :'new(...)', :args => [[:dach_farbe, :String]]}
    },
    :Strasse => {
        :sichtbar_machen => {:label => :sichtbar_machen},
        :laenge => {:label => :laenge, :ergebnis => :Integer},
        :breite => {:label => :breite, :ergebnis => :Integer},
        :oben => {:label => :oben, :ergebnis => :Integer},
        :unten => {:label => :unten, :ergebnis => :Integer},
        :links => {:label => :links, :ergebnis => :Integer},
        :rechts => {:label => :rechts, :ergebnis => :Integer},
        :clear => {:label => :clear}
    },
    :Strasse_class => {
        :new => {:label => :'new()', :args => [[:x, :Integer], [:y, :Integer], [:laenge, :Integer], [:breite, :Integer]]},
    },
    :Bus => {
        :sichtbar_machen => {:label => :sichtbar_machen},
        :position => {:label => :position, :ergebnis => :Point},
        :auf_position_setzen => {:label => :'auf_position_setzen(...)', :args => [[:x, :Integer], [:y, :Integer]]},
        :bewegen => {:label => :'bewegen(...)', :args => [[:'x_delta', :Integer], [:'y_delta', :Integer], [:'wiederholungen', :Integer], [:'wiederholen_nach [ms]', :Integer], [:'starten_nach [ms]', :Integer]]},
        :breite => {:label => :breite, :ergebnis => :Integer},
        :nach_vorne_fahren => {:label => :'nach_vorne_fahren(...)', :args => [[:wdh, :Integer], [:wdh_nach, :Integer], [:starten_nach, :Integer]]},
        :clear => {:label => :clear}
    },
    :Bus_class => {
        :new => {:label => :'new(...)', :args => [[:ausrichtung, :String]]},
    }
}

