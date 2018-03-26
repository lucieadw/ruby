require './Point'

# Author::    Birgit Wendholt 
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

class Kreis
  
  # initialize wird aufgerufen, wenn Instanzen der Klasse erzeugt werden
  # @xxxx sind die Instanzvariablen der Objekte

  def initialize(pos_x=20, pos_y=60,radius =15, farbe="rot", sichtbar=false )
    # Kreise haben ihren Referenzpunkt in pos_x,pos_y
    @mittelpunkt= Point.new(pos_x,pos_y);
    # die Farbe farbe
    farbe_aendern(farbe)
    @radius = radius
    # und die Sichbarkeit sichtbar
    @sichtbar = false
  end

  def mittelpunkt()
    return @mittelpunkt
  end

  def radius
    return @radius
  end

  def groesse_aendern(neuer_radius)
    loeschen()
    @radius = neuer_radius
    zeichnen()
  end

  def farbe
    return @farbe
  end

  def sichtbar?()
    return @sichtbar
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
    # Referenzpunkt um 10 Pixel nach unten verschieben
    bewegen_um_punkt(Point.new(0,10))
  end

  def horizontal_bewegen(anzahl)
    # Referenzpunkt um anzahl Pixel horizontal verschieben
    bewegen_um_punkt(Point.new(anzahl,0))
  end


  def vertikal_bewegen(anzahl)
    bewegen_um_punkt(Point.new(0,anzahl))
  end

  # Bewege einen GeoObject langsam vertikal um
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
    @mittelpunkt = @mittelpunkt + Point.new(0,entfernung)
  end

  def langsam_horizontal_bewegen(entfernung)
    absolute_entfernung = entfernung
    if( sichtbar?)
      delta  = 1
      if entfernung < 0
        delta = -1
        absolute_entfernung = - entfernung
      end
      x_delta = delta
      y_delta = 0
      Leinwand.gib_einzige_instanz().
          bewege(self,absolute_entfernung,x_delta,y_delta)
    end
    @mittelpunkt = @mittelpunkt + Point.new(entfernung,0)
  end

  # Der Kreis bewegt sich in beliebige Richtung mit einer gewissen Geschwindigkeit und einem Startwert.
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
    @mittelpunkt = @mittelpunkt+Point.new(delta_x,delta_y)*wdh
    if (sichtbar?())
      Leinwand.gib_einzige_instanz().bewege(self,wdh,delta_x,delta_y,wdh_nach,starten_nach)
    end
  end

  def farbe_aendern(neue_farbe)
#      neue_farbe = neue_farbe.downcase()
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

  # Methode für das Verschieben eines Kreis
  def bewegen_um_punkt(punkt)
    @mittelpunkt = @mittelpunkt + punkt
    if (sichtbar?)
      Leinwand.gib_einzige_instanz().verschiebe(self,punkt.x,punkt.y)
    end
  end

  # Ein Kreis wird nur gezeichnet, wenn die Instanz sichtbar ist
  def zeichnen()
    if sichtbar?()
      Leinwand.gib_einzige_instanz().zeichne_kreis(self)
    end
  end

  # Nur sichtbare Kreise werden auf der Leinwand gelöscht
  def loeschen()
    if sichtbar?
      Leinwand.gib_einzige_instanz().loesche(self)
    end
  end

  # Textdarstellung einer Kreisinstanz
  # für eine lesbare Darstellung
  def to_s
    "kreis #@nummer"
  end

end