require "./Rechteck"
require "./Leinwand"

class Strasse

  def initialize(x, y, laenge, breite)
    @strasse = Rechteck.new(x , y, strassen_laenge, breite, "grau")
  end

  def sichtbar_machen()
    @strasse.sichtbar_machen()
  end

  def strassen_laenge()
    Leinwand.gib_einzige_instanz().breite()
  end

  def breite()
    @strasse.breite
  end

  def oben()
    @strasse.obere_linke_ecke.y
  end

  def links()
    @strasse.obere_linke_ecke.x
  end

  def unten()
    @strasse.obere_linke_ecke.y + @strasse.hoehe
  end

  def rechts()
    @strasse.obere_linke_ecke.x + @strasse.breite
  end

  def clear()
    Leinwand.gib_einzige_instanz().alles_loeschen()
  end

end