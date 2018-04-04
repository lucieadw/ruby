require "./Kreis"
require "./Dreieck"
require "./Rechteck"

class StrassenLaterne

  def initialize()
    @schirm = Kreis.new(121, 81, 14, "orange", false)
    @stiel = Rechteck.new(118, 90, 5, 45, "grau", false)
    @fuss = Rechteck.new(106, 132, 30, 5, "grau", false)
  end

  def sichtbar_machen()
    @fuss.sichtbar_machen()
    @stiel.sichtbar_machen()
    @schirm.sichtbar_machen()
  end

  def position()
    Point.new(@fuss.obere_linke_ecke.x, @fuss.obere_linke_ecke.y + @fuss.hoehe)
  end

  def auf_position_setzen(ziel_pos_x, ziel_pos_y)
    delta_x = ziel_pos_x - position.x
    delta_y = ziel_pos_y - position.y
    bewegen(delta_x, delta_y, 1, 0, 0)
  end

  def bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @schirm.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @stiel.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @fuss.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
  end

  def breite()
    @schirm.radius*2
  end

  def hoehe()
    @fuss.hoehe + @stiel.hoehe + @schirm.radius*2
  end

  def tag_ansicht()
    @schirm.farbe_aendern("orange")
    @stiel.farbe_aendern("grau")
    @fuss.farbe_aendern("grau")
  end

  def nacht_ansicht()
    @schirm.farbe_aendern("gelb")
    @stiel.farbe_aendern("schwarz")
    @fuss.farbe_aendern("schwarz")
  end
  def clear()
    Leinwand.gib_einzige_instanz().alles_loeschen()
  end
end
