require "./Strasse"
require "./Leinwand"
require "./StrassenLaterne"
require "./Bus"
require "./Haus"

class StrassenSzene

  def initialize()
    @strasse = Strasse.new(0, 200, Leinwand.gib_einzige_instanz().breite(), 140)
    @haus1 = Haus.new("gruen")
    @haus2 = Haus.new("rot")
    @haus3 = Haus.new("gruen")
    @haus4 = Haus.new("orange")

    @haus5 = Haus.new("rot")
    @haus6 = Haus.new("gruen")
    @haus7 = Haus.new("gruen")
    @haus8 = Haus.new("orange")

    # mit if bedingung häuser ezeugen bis position.x > straßen breite? aber wie sichtbar machen?
    @haus1.auf_position_setzen(@strasse.links + 450, @strasse.oben - 2)
    @haus2.auf_position_setzen(@haus1.position.x + @haus1.breite + 50, @strasse.oben - 2)
    @haus3.auf_position_setzen(@haus2.position.x + @haus2.breite + 80, @strasse.oben - 2)
    @haus4.auf_position_setzen(@haus3.position.x + @haus3.breite + 70, @strasse.oben - 2)

    @haus5.auf_position_setzen(@strasse.links + 430, @strasse.unten + @haus1.hoehe + 5)
    @haus6.auf_position_setzen(@haus5.position.x + @haus5.breite + 70, @strasse.unten + @haus1.hoehe + 5)
    @haus7.auf_position_setzen(@haus6.position.x + @haus6.breite + 50, @strasse.unten + @haus1.hoehe + 5)
    @haus8.auf_position_setzen(@haus7.position.x + @haus7.breite + 60, @strasse.unten + @haus1.hoehe + 5)

    @bus1 = Bus.new("westen")
    @bus2 = Bus.new("osten")
    @bus3 = Bus.new("westen")
    @bus4 = Bus.new("osten")


    @laterne1 = StrassenLaterne.new()
    @laterne2 = StrassenLaterne.new()
    @laterne1.auf_position_setzen(@strasse.links + 450 - @laterne1.breite - 15, @strasse.oben - 2)
    @laterne2.auf_position_setzen(@haus2.position.x + @haus2.breite + @laterne1.breite + 5, @strasse.oben - 2)

    @laterne3 = StrassenLaterne.new()
    @laterne4 = StrassenLaterne.new()
    @laterne3.auf_position_setzen(@strasse.rechts - 600 + @laterne1.breite, @strasse.unten + @haus1.hoehe + 5)
    @laterne4.auf_position_setzen(@haus6.position.x - @laterne1.breite - 20, @strasse.unten + @haus1.hoehe + 5,)

    @sonne = Kreis.new(@haus1.position.x + 500, @strasse.oben - @haus1.hoehe - 50, 20, "orange")
    @mond = Kreis.new(@haus1.position.x + 490, @strasse.oben - @haus1.hoehe - 50, 20, "weiss")

    @stern1 = Kreis.new(810, 28, 3, "gelb")
    @stern2 = Kreis.new(724, 70, 3, "gelb")
    @stern3 = Kreis.new(650, 38, 3, "gelb")
    @stern4 = Kreis.new(590, 56, 3, "gelb")
    @stern5 = Kreis.new(520, 33, 3, "gelb")
    tag
    reset_animation

  end

  def sichtbar_machen()
    @strasse.sichtbar_machen()
    @haus1.sichtbar_machen()
    @haus2.sichtbar_machen()
    @haus3.sichtbar_machen()
    @haus4.sichtbar_machen()
    @haus5.sichtbar_machen()
    @haus6.sichtbar_machen()
    @haus7.sichtbar_machen()
    @haus8.sichtbar_machen()
    @bus1.sichtbar_machen()
    @bus3.sichtbar_machen()
    @bus2.sichtbar_machen()
    @bus4.sichtbar_machen()
    @laterne1.sichtbar_machen()
    @laterne2.sichtbar_machen()
    @laterne3.sichtbar_machen()
    @laterne4.sichtbar_machen()
    @sonne.sichtbar_machen()
  end

  def animation()
    @bus1.nach_vorne_fahren(1500, 12, 4)
    @bus2.nach_vorne_fahren(1500, 13, 4)
    @bus3.nach_vorne_fahren(1500, 19, 4)
    @bus4.nach_vorne_fahren(1500, 20, 4)

  end

  def reset_animation()
    busse_positionieren
  end

  def busse_positionieren()
    # schleife für abhängigkeit zur straße?
    s = 20 #standardabstand zum Straßenrand
    @bus1.auf_position_setzen(@strasse.rechts - @bus1.breite - 100, @strasse.oben + @bus1.hoehe + s)
    @bus2.auf_position_setzen(@strasse.links + 100, @strasse.unten - s - 10)
    @bus3.auf_position_setzen(@strasse.rechts - @bus1.breite * 2 - 200, @strasse.oben + @bus1.hoehe + s + 10)
    @bus4.auf_position_setzen(@strasse.links + @bus1.breite + 200, @strasse.unten - s)
  end

  def tag()
    @sonne.farbe_aendern("orange")
    @laterne1.tag_ansicht()
    @laterne2.tag_ansicht()
    @laterne3.tag_ansicht()
    @laterne4.tag_ansicht()
    @bus1.tag_ansicht()
    @bus2.tag_ansicht()
    @bus3.tag_ansicht()
    @bus4.tag_ansicht()
    @haus1.tages_ansicht()
    @haus2.tages_ansicht()
    @haus3.tages_ansicht()
    @haus4.tages_ansicht()
    @haus5.tages_ansicht()
    @haus6.tages_ansicht()
    @haus7.tages_ansicht()
    @haus8.tages_ansicht()

    @mond.unsichtbar_machen()
    @stern1.unsichtbar_machen()
    @stern2.unsichtbar_machen()
    @stern3.unsichtbar_machen()
    @stern4.unsichtbar_machen()
    @stern5.unsichtbar_machen()
  end

  def nacht()
    @sonne.farbe_aendern("gelb")
    @laterne1.nacht_ansicht()
    @laterne2.nacht_ansicht()
    @laterne3.nacht_ansicht()
    @laterne4.nacht_ansicht()
    @bus1.nacht_ansicht()
    @bus2.nacht_ansicht()
    @bus3.nacht_ansicht()
    @bus4.nacht_ansicht()
    @haus1.nacht_ansicht()
    @haus2.nacht_ansicht()
    @haus3.nacht_ansicht()
    @haus4.nacht_ansicht()
    @haus5.nacht_ansicht()
    @haus6.nacht_ansicht()
    @haus7.nacht_ansicht()
    @haus8.nacht_ansicht()
    @stern1.sichtbar_machen()
    @stern2.sichtbar_machen()
    @stern3.sichtbar_machen()
    @stern4.sichtbar_machen()
    @stern5.sichtbar_machen()
    @mond.sichtbar_machen()
    @haus1.nacht_ansicht()
    @haus2.nacht_ansicht()
    @haus3.nacht_ansicht()
    @haus4.nacht_ansicht()
  end

  def clear()
    Leinwand.gib_einzige_instanz().alles_loeschen()
  end
end