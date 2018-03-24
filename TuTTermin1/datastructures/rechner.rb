class Rechner
  def initialize(hersteller, festplatte, grafikkarte, prozessor)

    @hersteller = hersteller
    @festplatte = festplatte
    @grafikkarte = grafikkarte
    @prozessor = prozessor
  end

 def preis()
   rechner_preis = @festplatte.preis() + @grafikkarte.preis() + @prozessor.preis()
   return rechner_preis
 end

  def gib_hersteller()
    return @hersteller
  end

  def gib_festplattenspeicher()
    return @festplatte.gib_freien_speicher()
  end

  def gib_grafikkartenhersteller()
    return @grafikkarte.gib_hersteller()
  end

  def grafik_vr()
    return @grafikkarte.ist_vr_ready?()
  end

  def gib_prozessor()
    return @prozessor
  end

end