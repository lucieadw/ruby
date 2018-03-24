require "./Kreis"
require "./Dreieck"
require "./Rechteck"

class StehLampe

  # Eine Stehlampe setzt sich aus den Komponenten
  # Schirm, Stiel, Fuss und 4 Leuchtstrahlen zusammen
  # Die Komponenten der Stehlampe sind geometrische Objekte der
  # Klassen Kreis, Rechteck, Dreieck.
  # Diese Objekte müssen mit der richtigen Farbe, Größe und Position
  # erzeugt werden, damit die Zusammenstellung eine Stehlampe ergibt.
  def initialize()
    @schirm = Kreis.new(120,60,40,"gelb",false)
    @stiel = Rechteck.new(116,90,10,80,"gruen",false)
    @fuss = Rechteck.new(84,165,70,15,"blau",false)
    @leuchtstrahl1 = Rechteck.new(90,97,3,25,"gelb",false)
    @leuchtstrahl2 = Rechteck.new(100,97,3,25,"gelb",false)
    @leuchtstrahl3 = Rechteck.new(135,97,3,25,"gelb",false)
    @leuchtstrahl4 = Rechteck.new(145,97,3,25,"gelb",false)
  end

  # Eine Stehlampe wird sichtbar, wenn alle Komponenten 
  # der Stehlampe sichtbar gemacht werden
  def sichtbar_machen()
    @fuss.sichtbar_machen()
    @stiel.sichtbar_machen()
    @schirm.sichtbar_machen()
    @leuchtstrahl1.sichtbar_machen()
    @leuchtstrahl2.sichtbar_machen()
    @leuchtstrahl3.sichtbar_machen()
    @leuchtstrahl4.sichtbar_machen()
  end

  # TODO
  # vertikal_bewegen(anzahl_punkte)
  # Eine Stehlampe wird vertikal bewegt, indem alle
  # Komponenten vertikal bewegt werden.
  #
  # Parameter:
  #   anzahl_punkte - gibt an um wieviele Punkte verschoben werden soll

  # TODO
  # horizontal_bewegen(anzahl_punkte)
  # Eine Stehlampe wird horizontal bewegt, indem alle
  # Komponenten horizontal bewegt werden.
  #
  # Parameter:
  #   anzahl_punkte - gibt an um wieviele Punkte verschoben werden soll

  # TODO
  # bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
  # Bewegt die Stehlampe wdh-mal in Richtung delta_x, delta_y. Die Geschwindigkeit der
  # Bewegung wird über den Parameter wdh_nach gesteuert. Ist wdh_nach = 10, dann bedeutet dies,
  # dass die Bewegung in delta_x, delta_y Richtung alle 10 ms wiederholt wird.
  # Die gesamte Bewegung startet nach starten_nach.
  #
  # Wenn die Stehlampe sichtbar ist, dann wird diese animiert über den Bildschirm bewegt
  #
  # Eine Stehlampe wird bewegt, indem alle Komponenten gleichförmig bewegt werden.
  #
  # Parameter:
  #   delta_x - Bewegung in x-Richtung
  #   delta_y - Bewegung in y-Richtung
  #   wdh - Anzahl der Einzel-Bewegungen in delta_x,delta_y Richtung
  #   wdh_nach - Zeit zwischen zwei Einzelbewegungen in ms
  #   starten_nach - Zeitspanne ab der aktuellen Zeit, bis die gesamte Bewegung beginnt
  #

  # Zum Ändern der Leuchtfarbe werden alle Leuchtstrahlen in die neue Farbe geändert
  def leucht_farbe_aendern(farbe)
    @leuchtstrahl1.farbe_aendern(farbe)
    @leuchtstrahl2.farbe_aendern(farbe)
    @leuchtstrahl3.farbe_aendern(farbe)
    @leuchtstrahl4.farbe_aendern(farbe)
  end


  # TODO
  # Die Methode liefert die Position der Stehlampe zurück
  #
  # Die Position der Stehlampe ist definiert als
  # linke untere Ecke des Stehlampenfußes
  #
  def position()
    #@fuss.obere_linke_ecke + Point.new(0,@fuss.hoehe)
    Point.new(@fuss.obere_linke_ecke.x, @fuss.obere_linke_ecke.y + @fuss.hoehe)
  end

  # TODO
  # auf_position_setzen(ziel_pos_x,ziel_pos_y)
  # Verschiebt die Stehlampe so, dass die linke untere Ecke des Fußes die Position
  # (ziel_pos_x,ziel_pos_y) hat.
  #
  # Parameter
  #   ziel_pos_x - die x-Koordinate der linken unteren Ecke des Fusses der Stehlampe
  #   ziel_pos_y - die y-Koordinate der linken unteren Ecke des Fusses der Stehlampe


  # TODO
  # einschalten
  #
  # Schaltet die Stehlampe ein. Beim Einschalten werden der Lampenschirm und
  # die Leuchtstrahlen gelb.

  # TODO
  # ausschalten
  #
  # Schaltet die Stehlampe aus. Beim Ausschalten wird der Lampenschirm orange
  # und die Leuchtstrahlen werden unsichtbar

  def to_s()
    "Stehlampe (#{@nummer})"
  end
end