class Grafikkarte

  def initialize(hersteller, grafik_speicher, vr_readyness, modell,preis)
    #TODO (vr_readyness ist true oder false - > kann graka vr oder nicht?)
    @hersteller = hersteller
    @grafik_speicher = grafik_speicher
    @vr_ready = vr_readyness
    @modell = modell
    @preis = preis
  end

  def gib_hersteller()
    return @hersteller
  end

  def gib_grafik_speicher()
    return @grafik_speicher
  end

  def ist_vr_ready?()
    return @vr_ready
  end

  def gib_modell()
    return @modell
  end

  def preis()
    return @preis
  end
end