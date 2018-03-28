require './Rechteck'
require "./Kreis"

class Bus

  def initialize(ansicht)
    @ansicht = ansicht.downcase
    if @ansicht == "westen"
      @fahrgestell = Rechteck.new(x, y, 40, 30, "blau")
      @nase = Rechteck.new(x, y, @fahrgestell.breite / 4, @fahrgestell.hoehe / 2, "blau")
      @fenster1 = Rechteck.new(x, y, breite, hoehe, "weiss")
      @fenster2 = Rechteck.new(x, y, breite, hoehe, "weiss")
      @fenster3 = Rechteck.new(x, y, breite, hoehe, "weiss")
      @rad1 = Kreis.new(x, y, 10, "rot")
      @rad2 = Kreis.new(x, y, 10, "rot")

    elsif @ansicht == "osten"
      @fahrgestell = Rechteck.new(x, y, 40, 30, "blau")
      @nase = Rechteck.new(x, y, @fahrgestell.breite / 4, @fahrgestell.hoehe / 2, "blau")
      @fenster1 = Rechteck.new(x, y, breite, hoehe, "weiss")
      @fenster2 = Rechteck.new(x, y, breite, hoehe, "weiss")
      @fenster3 = Rechteck.new(x, y, breite, hoehe, "weiss")
      @rad1 = Kreis.new(x, y, 10, "rot")
      @rad2 = Kreis.new(x, y, 10, "rot")
    end

    def sichtbar_machen()
      @fahrgestell.sichtbar_machen
      @nase.sichtbar_machen
      @fenster1.sichtbar_machen
      @fenster2.sichtbar_machen
      @fenster3.sichtbar_machen
      @rad1.sichtbar_machen
      @rad2.sichtbar_machen
    end

    def position()

    end

    def auf_position_setzen(x,y)
      delta_x = x - position.x
      delta_y = y - position.y
      @fahrgestell.bewegen(delta_x, delta_y, 1,0,0)
      @nase.bewegen(delta_x, delta_y, 1,0,0)
      @fenster1.bewegen(delta_x, delta_y, 1,0,0)
      @fenster2.bewegen(delta_x, delta_y, 1,0,0)
      @fenster3.bewegen(delta_x, delta_y, 1,0,0)
      @rad1.bewegen(delta_x, delta_y, 1,0,0)
      @rad2.bewegen(delta_x, delta_y, 1,0,0)
    end

    def bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
      @fahrgestell.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
      @nase.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
      @fenster1.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
      @fenster2.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
      @fenster3.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
      @rad1.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
      @rad2.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    end

    def breite()
      @fahrgestell.breite + @nase.breite
    end

    def nach_vorne_fahren(wdh, wdh_nach, starten_nach)
      delta_x = 1
      if @ansicht == "westen"
        delta_x = -1
      elsif @ansicht == "osten"
        delta_x = 1
      end
      @fahrgestell.bewegen(delta_x, 0, wdh, wdh_nach, starten_nach)
      @nase.bewegen(delta_x, 0, wdh, wdh_nach, starten_nach)
      @fenster1.bewegen(delta_x, 0, wdh, wdh_nach, starten_nach)
      @fenster2.bewegen(delta_x, 0, wdh, wdh_nach, starten_nach)
      @fenster3.bewegen(delta_x, 0, wdh, wdh_nach, starten_nach)
      @rad1.bewegen(delta_x, 0, wdh, wdh_nach, starten_nach)
      @rad2.bewegen(delta_x, 0, wdh, wdh_nach, starten_nach)
    end

    def clear()
      Leinwand.gib_einzige_instanz().alles_loeschen()
    end

  end
  end