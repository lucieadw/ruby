class Festplatte

  def initialize(hersteller,speicherkapazitaet,belegter_speicherplatz,preis)
    #TODO
    @hersteller = hersteller
    @speicher = speicherkapazitaet
    @belegter_speicher = belegter_speicherplatz
    @preis = preis
  end

  def gib_hersteller()
    return @hersteller
  end

  def gib_freien_speicher()
    #TODO - berechnet wie viel Speicher noch frei ist
   freier_speicher = @speicher - @belegter_speicher
    return freier_speicher
  end

  def gib_belegter_speicher()
    return @belegter_speicher
  end

  def preis()
    return @preis
  end


end