require "./Kreis"
require "./Dreieck"
require "./Rechteck"

class StrassenLaterne

  def initialize()
    @schirm = Kreis.new(121, 70, 20, "gelb", false)
    @stiel = Rechteck.new(118, 90, 6, 50, "grau", false)
    @fuss = Rechteck.new(100, 140, 40, 8, "grau", false)
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
    delta = Point.new(ziel_pos_x - position.x, ziel_pos_y - position.y)
    @schirm.bewegen_um_punkt(delta)
    @stiel.bewegen_um_punkt(delta)
    @fuss.bewegen_um_punkt(delta)
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
  def clear()
    Leinwand.gib_einzige_instanz().alles_loeschen()
  end
end
