require "./Rechteck"
require "./Dreieck"
class Haus

  #TODO
 #def initialize(dach_farbe)
 #end
  def initialize(dach_farbe)
    @dach_farbe = dach_farbe
    @dach = Dreieck.new()
    @fassade = Rechteck.new()
  end
  # TODO
 #def sichtbar_machen()
 #end
  def  sichtbar_machen

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