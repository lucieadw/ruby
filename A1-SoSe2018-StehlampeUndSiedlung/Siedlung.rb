require "./Haus"
class Siedlung


  def initialize()
    @haus1 = Haus.new("gelb")
    @haus2 = Haus.new("rot",2.5)
    @haus3 = Haus.new("gruen",) # wenn kein faktor da steht, ist der der default faktor aus der class Haus
    @haus4 = Haus.new("blau",2.5)

    @haus1.auf_position_setzen(70, 210)
    @haus2.auf_position_setzen(140, 230)
    @haus3.auf_position_setzen(210, 210)
    @haus4.auf_position_setzen(280, 230)

    # Alles hier ist durch rumschieben entstanden, Sonne, Mond und Sterne brauchen wir auch nicht.

    @sonne = Kreis.new(370, 60, 20, "orange")
    @mond = Kreis.new(362, 60, 20, "weiss")

    @stern1 = Kreis.new(310,28,3,"orange")
    @stern2 = Kreis.new(224,70,3,"orange")
    @stern3 = Kreis.new(150,38,3,"orange")
    @stern4 = Kreis.new(90,56,3,"orange")
  end

  def sichtbar_machen()
    @haus1.sichtbar_machen()
    @haus3.sichtbar_machen()
    @haus2.sichtbar_machen()
    @haus4.sichtbar_machen()
    @sonne.sichtbar_machen()
  end


  def nacht()
    @stern1.sichtbar_machen()
    @stern2.sichtbar_machen()
    @stern3.sichtbar_machen()
    @stern4.sichtbar_machen()
    @mond.sichtbar_machen()
    @haus1.nacht_ansicht()
    @haus2.nacht_ansicht()
    @haus3.nacht_ansicht()
    @haus4.nacht_ansicht()
  end

  def tag()
    @mond.unsichtbar_machen()
    @haus1.tages_ansicht()
    @haus2.tages_ansicht()
    @haus3.tages_ansicht()
    @haus4.tages_ansicht()
  end
end
