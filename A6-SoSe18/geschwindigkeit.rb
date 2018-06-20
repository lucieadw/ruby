class Geschwindigkeit
  include EinheitenGroesse

  def initialize(laenge, zeit)
    if !laenge.is_a?(LaengenMass) && zeit.is_a?(ZeitGroesse)
      raise ArgumentError
    else
      @laenge = laenge
      @zeit = zeit
    end
    super(@laenge.value / @zeit.value.to_f)
  end

  def symbol()
    "#{@laenge.symbol}/#{@zeit.symbol}".to_sym
  end

  def spezifischer_faktor()
    @laenge.spezifischer_faktor / @zeit.spezifischer_faktor.to_f
  end

  def common_supertype()
    return Geschwindigkeit
  end

  def von_basis(wert)
    Geschwindigkeit.new(@laenge.von_basis(wert), @zeit.von_basis(1))
  end

  def umrechnen_in(*ziel_groesse_typ)
    Geschwindigkeit.new(@laenge.umrechnen_in(ziel_groesse_typ[0]), @zeit.umrechnen_in(ziel_groesse_typ[1]))
  end

  def to_s()
    if value.is_a?(Vector)
      return "#{value.magnitude} (#{value[0]},#{value[1]}) #{symbol}"
    else
      return super.to_s
    end
  end
end
