require "./Rechteck"
require "./Dreieck"
class Haus

  #TODO
 #def initialize(dach_farbe)
 #end
  def initialize(dach_farbe)
    @dach = Dreieck.new(50,10,20,40,dach_farbe)
    @fassade = Rechteck.new(30,30,40,40,"gelb")
    @tuer = Rechteck.new(50,50,10,20,"gruen")
    @fenster = Rechteck.new(35,40,10,10,"weiss")
  end
  # TODO
 #def sichtbar_machen()
 #end
  def  sichtbar_machen()
    @dach.sichtbar_machen()
    @fassade.sichtbar_machen()
    @tuer.sichtbar_machen()
    @fenster.sichtbar_machen()

  end

  # TODO
 #def tages_ansicht()
 #end

  # TODO
 #def nacht_ansicht()
 #end

  # TODO
 #def position()
 #end

  # TODO Lösen Sie diese Methode durch geeigneten Aufruf der Methode bewegen der Klasse Haus
 #def auf_position_setzen(x,y)
 #end

  # TODO
 #def bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
 #end
end