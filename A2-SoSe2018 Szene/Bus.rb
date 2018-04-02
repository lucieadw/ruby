require './Rechteck'
require "./Kreis"

class Bus

  def initialize(ansicht)
    @ansicht = ansicht.downcase

    @fahrgestell = Rechteck.new(20, 0, 45, 35, "orange")
    @fenster1 = Rechteck.new(23, 4, 12, 15, "weiss")
    @fenster2 = Rechteck.new(37, 4, 12, 15, "weiss")
    @fenster3 = Rechteck.new(51, 4, 12, 15, "weiss")
    @rad1 = Kreis.new(31, 35, 6, "schwarz")
    @rad2 = Kreis.new(54, 35, 6, "schwarz")

    case @ansicht
      when "osten"
        @nase = Rechteck.new(@fahrgestell.obere_linke_ecke.x + @fahrgestell.breite, @fahrgestell.hoehe / 2.0 + 2, @fahrgestell.breite / 5.0, @fahrgestell.hoehe / 2.0 - 2, "orange")
      when "westen"
        @nase = Rechteck.new(@fahrgestell.obere_linke_ecke.x - @fahrgestell.breite / 5.0, @fahrgestell.hoehe / 2.0 + 2, @fahrgestell.breite / 5.0, @fahrgestell.hoehe / 2.0 - 2, "orange")
      else
        @nase = Rechteck.new(@fahrgestell.obere_linke_ecke.x + @fahrgestell.breite, @fahrgestell.hoehe / 2.0 + 2, @fahrgestell.breite / 5.0, @fahrgestell.hoehe / 2.0 - 2, "orange")
    end
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
    Point.new(@fahrgestell.obere_linke_ecke.x, @rad1.mittelpunkt.y + @rad1.radius)
  end

  def auf_position_setzen(x, y)
    delta_x = x - position.x
    delta_y = y - position.y
    @fahrgestell.bewegen(delta_x, delta_y, 1, 0, 0)
    @nase.bewegen(delta_x, delta_y, 1, 0, 0)
    @fenster1.bewegen(delta_x, delta_y, 1, 0, 0)
    @fenster2.bewegen(delta_x, delta_y, 1, 0, 0)
    @fenster3.bewegen(delta_x, delta_y, 1, 0, 0)
    @rad1.bewegen(delta_x, delta_y, 1, 0, 0)
    @rad2.bewegen(delta_x, delta_y, 1, 0, 0)
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

  def hoehe()
    @fahrgestell.hoehe + @rad1.radius
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

  def nacht_ansicht()
    @fahrgestell.farbe_aendern("schwarz")
    @nase.farbe_aendern("schwarz")
    @fenster1.farbe_aendern("gelb")
    @fenster2.farbe_aendern("gelb")
    @fenster3.farbe_aendern("gelb")
  end

  def tag_ansicht()
    @fahrgestell.farbe_aendern("orange")
    @nase.farbe_aendern("orange")
    @fenster1.farbe_aendern("weiss")
    @fenster2.farbe_aendern("weiss")
    @fenster3.farbe_aendern("weiss")
  end

  def clear()
    Leinwand.gib_einzige_instanz().alles_loeschen()
  end

end
