require "./Rechteck"
require "./Dreieck"
class Haus

  def initialize(dach_farbe)
    faktor = 2
    @dach_farbe = dach_farbe
    @dach = Dreieck.new(50, 10, 20 * faktor, 40 * faktor, @dach_farbe)
    @fassade = Rechteck.new(@dach.spitze.x - @dach.breite / 2,
                            @dach.spitze.y + @dach.hoehe,
                            40 * faktor, 40 * faktor, "orange")
    @tuer = Rechteck.new(@dach.spitze.x - @dach.breite / 2 + @fassade.breite / 2,
                         @dach.spitze.y + @dach.hoehe + @fassade.hoehe / 2,
                         10 * faktor, 20 * faktor, "gruen")
    @fenster = Rechteck.new(@dach.spitze.x - @dach.breite / 2 + @fassade.breite / 5,
                            @dach.spitze.y + @dach.hoehe + @fassade.hoehe / 5,
                            10 * faktor, 10 * faktor, "hellgrau")
  end

  def sichtbar_machen()
    @dach.sichtbar_machen()
    @fassade.sichtbar_machen()
    @tuer.sichtbar_machen()
    @fenster.sichtbar_machen()
  end

  def position()
    Point.new(@fassade.obere_linke_ecke.x, @fassade.obere_linke_ecke.y + @fassade.hoehe)
  end

  def auf_position_setzen(x, y)
    delta_x = x - position.x
    delta_y = y - position.y
    @dach.bewegen(delta_x, delta_y, 1, 0, 0)
    @fassade.bewegen(delta_x, delta_y, 1, 0, 0)
    @tuer.bewegen(delta_x, delta_y, 1, 0, 0)
    @fenster.bewegen(delta_x, delta_y, 1, 0, 0)
  end

  def bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @dach.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @fassade.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @tuer.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @fenster.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
  end

  def hoehe()
  @dach.hoehe + @fassade.hoehe

  end

  def breite()
     @fassade.breite
    end

  def clear()
    Leinwand.gib_einzige_instanz().alles_loeschen()
  end

end