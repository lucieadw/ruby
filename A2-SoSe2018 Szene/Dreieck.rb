require './Point'

# Author::    Birgit Wendholt 
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

class Dreieck
  
  # Wir gehen von einem gleichschenkligen Dreick aus
  # Siehe auch zeichne_dreieck in der Klasse Leinwand
  def initialize(pos_x=50,pos_y=15,hoehe=30,breite=40,farbe="gruen",sichtbar=false)
    # Dreiecke haben zu Beginn ihr Spitze im Punkt (pos_x,pos_y)
    @spitze = Point.new(pos_x,pos_y)
    # die Hoehe hoehe und Breite breite
    @hoehe = hoehe
    @breite = breite
    # die Farbe farbe
    farbe_aendern(farbe)
    # und die Sichtbarkeit sichtbar 
    @sichtbar = sichtbar
  end
  
  # Ist das Dreieck sichtbar
  def sichtbar?
    return @sichtbar
  end

  def farbe()
    return @farbe    
  end
  
  def spitze()
    return @spitze
  end

  def hoehe()
    return @hoehe
  end
  
  def breite()
      return @breite    
  end
  # Mache das Dreieck sichtbar  
  def sichtbar_machen
      @sichtbar = true
      zeichnen()
  end
  
  # und unsichtbar
  def unsichtbar_machen
     loeschen()
     @sichtbar = false    
  end
  
  # Verschiebe das Dreieck im 10 Bildpunkte nach unten
  def nach_unten_bewegen
    bewegen_um_punkt(Point.new(0,10))
  end
  
  # Verschiebe das Dreieck um anzahl Bildpunkte horizontal
  def horizontal_bewegen(anzahl)
     bewegen_um_punkt(Point.new(anzahl,0))        
  end
  
  # Verschiebe das Dreieck um anzahl Bildpunkte vertikal
  def vertikal_bewegen(anzahl)
    bewegen_um_punkt(Point.new(0,anzahl))
  end
  
  # Bewegt das Dreieck langsam vertikal um 
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
      @spitze = @spitze + Point.new(0,entfernung)
  end

  
  # Das Dreieck bewegt sich in beliebige Richtung mit einer gewissen Geschwindigkeit und einem Startwert.
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
      @spitze = @spitze+Point.new(delta_x,delta_y)*wdh
      if (sichtbar?())
        Leinwand.gib_einzige_instanz().bewege(self,wdh,delta_x,delta_y,wdh_nach,starten_nach)
      end
  end
  
  # Methode für das Bewegen eines Dreieck
  def bewegen_um_punkt(punkt)
    @spitze = @spitze + punkt
    # Zeichne das verschobene Dreieck
      if (sichtbar?)
        Leinwand.gib_einzige_instanz().verschiebe(self,punkt.x,punkt.y)      
      end
  end
  
  # Ändere die Farbe des Dreiecks auf neue_farbe
  # Zeige das Dreieck mit der neuen Farbe an
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

  def groesse_aendern(neue_breite,neue_hoehe)
     # Loesche zuerst die alte Darstellung
     loeschen()
     @hoehe = neue_hoehe
     @breite = neue_breite
     # Zeichne das skalierte Dreieck
     zeichnen()        
  end
  
  def to_s()
      return "dreieck #@nummer"      
  end
  
  def zeichnen()
      if sichtbar?()
        Leinwand.gib_einzige_instanz().zeichne_dreieck(self)
      end    
  end
  
  def loeschen()
      if sichtbar?()
        Leinwand.gib_einzige_instanz().loesche(self)
      end
  end
  
end