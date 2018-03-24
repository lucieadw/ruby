class Monitor

  def initialize(hersteller, groesse,preis) #groesse in zoll
    @hersteller = hersteller
    @groesse = groesse
    @preis = preis
  end

  def gib_hersteller()
    return @hersteller
  end

  def gib_groesse()
    return @groesse
  end

  def preis()
    return @preis
  end
end