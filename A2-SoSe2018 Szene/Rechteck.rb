require './Point'

# Author::    Birgit Wendholt
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

class Rechteck
  # initialize wird aufgerufen, nachdem ein Objekt der Klasse erzeugt wurde
  # @xxxx sind die Instanzvariablen der Instanzen
  def initialize(pos_x=60,pos_y=50,breite=30,hoehe=30,farbe="blau",sichtbar=false)
    # Rechtecke haben ihre obere linke Ecke im Punkt pos_x,pos_y
    @obere_linke_ecke = Point.new(pos_x,pos_y)
    # die Breite breite und die Hohe hoehe
    @breite = breite
    @hoehe = hoehe
    # die Farbe farbe
    farbe_aendern(farbe)
    # und die Sichtbarkeit sichtbar
    @sichtbar = sichtbar

  end

  def sichtbar?
    return @sichtbar
  end

  def obere_linke_ecke
    return @obere_linke_ecke
  end

  def hoehe
    return @hoehe
  end

  def breite
    return @breite
  end

  def sichtbar_machen()
    @sichtbar = true
    zeichnen()
  end

  def unsichtbar_machen()
    loeschen()
    @sichtbar = false
  end

  def nach_unten_bewegen()
    # Obere rechte Ecke um 10 Pixel nach unten verschieben
    bewegen_um_punkt(Point.new(0,10))
  end

  def horizontal_bewegen(anzahl)
    # Obere rechte Ecke um Anzahl Pixel horizontal verschieben
    bewegen_um_punkt(Point.new(anzahl,0))
  end

  def vertikal_bewegen(anzahl)
    # Obere rechte Ecke um Anzahl Pixel vertikal verschieben
    bewegen_um_punkt(Point.new(0,anzahl))
  end

  # Bewegt das Rechteck langsam vertikal um
  # entfernung Bildpunkte
  def langsam_vertikal_bewegen(entfernung)
    absolute_entfernung = entfernung
    if( sichtbar?)
      delta  = 1
      if entfernung < 0
        delta = -1
        absolute_entfernung = - entfernung
      end
      x_delta = 0
      y_delta = delta
      Leinwand.gib_einzige_instanz().
      bewege(self,absolute_entfernung,x_delta,y_delta)
    end
    @obere_linke_ecke = @obere_linke_ecke + Point.new(0,entfernung)
  end

  # Das Rechteck bewegt sich in beliebige Richtung mit einer gewissen Geschwindigkeit und einem Startwert.
  # Wenn das Objekt sichtbar ist, dann wird die Bewegung auf dem Bildschirm animiert. Kleine delta_x, delta_y 
  # bewirken 
  #
  # Parameter:
  #   delta_x, delta_y: Richtung und Entfernung eines Schrittes
  #   wdh: Anzahl der Wiederholungen, die sich das Objekt in Richtung delta_x, delta_y bewegt
  #   wdh_nach: Anzahl der Millisekunden, die zwischen zwei Einzelschritten der Gesamtbewegung gewartet wird 
  #   starten_nach: Anzahld der Millisekunden, die gewartet werden, bis die Gesamtbewegung startet
  #
  def bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
      @obere_linke_ecke = @obere_linke_ecke+Point.new(delta_x,delta_y)*wdh
      if (sichtbar?())
        Leinwand.gib_einzige_instanz().bewege(self,wdh,delta_x,delta_y,wdh_nach,starten_nach)
      end
  end

  def farbe
    return @farbe
  end

  def farbe_aendern(neue_farbe)
    if  neue_farbe == "gruen"
      @farbe = :green
    end
    if neue_farbe == "rot"
      @farbe = :red
    end
    if  neue_farbe == "blau"
      @farbe = :blue
    end
    if neue_farbe == "gelb"
      @farbe = :yellow
    end
    if neue_farbe == "weiss"
      @farbe = :white
    end
    if neue_farbe == "schwarz"
      @farbe = :black
    end
    if neue_farbe == "grau"
      @farbe = :grey
    end
    if neue_farbe == "hellgrau"
      @farbe = :lightgrey
    end
    if neue_farbe == "orange"
      @farbe = :orange
    end
    if (sichtbar?)
      Leinwand.gib_einzige_instanz().farbe_aendern(self)
    end
  end

  def groesse_aendern(neue_breite,neue_hoehe=neue_breite)
    loeschen()
    @breite = neue_breite
    @hoehe =  neue_hoehe
    zeichnen()
  end

  # Textdarstellung einer Kreisinstanz
  # für eine lesbare Darstellung
  def to_s
    "rechteck #@nummer"
  end

  # Methode für das Verschieben eines Rechtecks
  def bewegen_um_punkt(punkt)
    @obere_linke_ecke = @obere_linke_ecke + punkt
    if (sichtbar?)
      Leinwand.gib_einzige_instanz().verschiebe(self,punkt.x,punkt.y)
    end
  end

  # Methoden nutzen die der Rechteckinstanz bekannte Leinwand, um das Rechteck darzustellen
  def zeichnen()
    if (sichtbar?)
      Leinwand.gib_einzige_instanz().zeichne_rechteck(self)
    end
  end

  def loeschen()
    if (sichtbar?)
      Leinwand.gib_einzige_instanz().loesche(self)
    end
  end

end