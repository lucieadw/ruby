require "./Kreis"
require "./Dreieck"
require "./Rechteck"

class StehLampe

  def initialize()
    @schirm = Kreis.new(120, 60, 40, "gelb", false)
    @stiel = Rechteck.new(116, 90, 10, 80, "gruen", false)
    @fuss = Rechteck.new(84, 165, 70, 15, "blau", false)
    @leuchtstrahl1 = Rechteck.new(90, 97, 3, 25, "gelb", false)
    @leuchtstrahl2 = Rechteck.new(100, 97, 3, 25, "gelb", false)
    @leuchtstrahl3 = Rechteck.new(135, 97, 3, 25, "gelb", false)
    @leuchtstrahl4 = Rechteck.new(145, 97, 3, 25, "gelb", false)
  end

  def sichtbar_machen()
    @fuss.sichtbar_machen()
    @stiel.sichtbar_machen()
    @schirm.sichtbar_machen()
    @leuchtstrahl1.sichtbar_machen()
    @leuchtstrahl2.sichtbar_machen()
    @leuchtstrahl3.sichtbar_machen()
    @leuchtstrahl4.sichtbar_machen()
  end


  def vertikal_bewegen(anzahl_punkte)
    @fuss.vertikal_bewegen(anzahl_punkte)
    @stiel.vertikal_bewegen(anzahl_punkte)
    @schirm.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl1.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl2.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl3.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl4.vertikal_bewegen(anzahl_punkte)
  end

  def horizontal_bewegen(anzahl_punkte)
    @fuss.horizontal_bewegen(anzahl_punkte)
    @stiel.horizontal_bewegen(anzahl_punkte)
    @schirm.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl1.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl2.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl3.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl4.horizontal_bewegen(anzahl_punkte)
  end


  def bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @schirm.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @stiel.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @fuss.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @leuchtstrahl1.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @leuchtstrahl2.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @leuchtstrahl3.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @leuchtstrahl4.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
  end


  def leucht_farbe_aendern(farbe)
    @leuchtstrahl1.farbe_aendern(farbe)
    @leuchtstrahl2.farbe_aendern(farbe)
    @leuchtstrahl3.farbe_aendern(farbe)
    @leuchtstrahl4.farbe_aendern(farbe)
  end


  def position()
    Point.new(@fuss.obere_linke_ecke.x, @fuss.obere_linke_ecke.y + @fuss.hoehe)
  end

# die Auskommentierten sachen sind hier nur verscheidene Herangehensweisen, die ich getestet habe
  def auf_position_setzen(ziel_pos_x, ziel_pos_y)
    #position_neu = Point.new(ziel_pos_x,ziel_pos_y) - self.position
    delta = Point.new(ziel_pos_x - self.position.x, ziel_pos_y - self.position.y )
    #delta_x = ziel_pos_x - self.position.x
    #delta_y = ziel_pos_y - self.position.y (mit .bewegen)

    @schirm.bewegen_um_punkt(delta)
    @stiel.bewegen_um_punkt(delta)
    @fuss.bewegen_um_punkt(delta)
    @leuchtstrahl1.bewegen_um_punkt(delta)
    @leuchtstrahl2.bewegen_um_punkt(delta)
    @leuchtstrahl3.bewegen_um_punkt(delta)
    @leuchtstrahl4.bewegen_um_punkt(delta)

  end


  def einschalten()
    @schirm.farbe_aendern("gelb")
    @leuchtstrahl1.farbe_aendern("gelb")
    @leuchtstrahl2.farbe_aendern("gelb")
    @leuchtstrahl3.farbe_aendern("gelb")
    @leuchtstrahl4.farbe_aendern("gelb")
  end


  def ausschalten()
    @schirm.farbe_aendern("orange")
    @leuchtstrahl1.farbe_aendern("weiss")
    @leuchtstrahl2.farbe_aendern("weiss")
    @leuchtstrahl3.farbe_aendern("weiss")
    @leuchtstrahl4.farbe_aendern("weiss")
  end

  def to_s()
    "Stehlampe (#{@nummer})"
  end
end