require "./Strasse"
require "./Leinwand"
require "./StrassenLaterne"
require "./Bus"
require "./Haus"

class StrassenSzene

  def initialize()
    @strasse = Strasse.new(0, 200, nil, 150)
    @haus1 = Haus.new("grau")
    @haus2 = Haus.new("grau")
    @haus3 = Haus.new("grau")
    @haus4 = Haus.new("grau")

    @haus1.auf_position_setzen(@strasse.links + (@haus1.breite + 50) * 0 + 50, @strasse.oben)
    @haus2.auf_position_setzen(@strasse.links + (@haus1.breite + 50) * 1 + 50, @strasse.oben)
    @haus3.auf_position_setzen(@strasse.links + (@haus1.breite + 50) * 2 + 50, @strasse.oben)
    @haus4.auf_position_setzen(@strasse.links + (@haus1.breite + 50) * 3 + 50, @strasse.oben)

    #@bus1 = Bus.new("westen")
   # @bus2 = Bus.new("osten")
    #@bus3 = Bus.new("westen")
   # @bus4 = Bus.new("osten")

    @laterne1 = StrassenLaterne.new()
    @laterne2 = StrassenLaterne.new()
    @laterne3 = StrassenLaterne.new()
  end

  def sichtbar_machen()
    @strasse.sichtbar_machen()
    @haus1.sichtbar_machen()
    @haus2.sichtbar_machen()
    @haus3.sichtbar_machen()
    @haus4.sichtbar_machen()
    #@bus1.sichtbar_machen()
    #@bus2.sichtbar_machen()
    #@bus3.sichtbar_machen()
    #@bus4.sichtbar_machen()
    @laterne1.sichtbar_machen()
    @laterne2.sichtbar_machen()
    @laterne3.sichtbar_machen()
  end

  def animation()

  end

  def reset_animation()

  end

  def busse_positionieren()
  end


  def clear()
    Leinwand.gib_einzige_instanz().alles_loeschen()
  end

end