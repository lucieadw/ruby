class Prozessor

  def initialize(hersteller,anzahl_cores,takt_frequenz,preis)
    @hersteller = hersteller
    @anzahl_cores = anzahl_cores
    @takt = takt_frequenz
    @preis = preis
  end

  def gib_hersteller()
    return @hersteller
  end

  def gib_cores()
    return @anzahl_cores
  end

  def gib_takt()
    return @takt
  end

  def preis()
    return @preis
  end

end