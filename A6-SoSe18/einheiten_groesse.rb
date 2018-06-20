require "./object"
module EinheitenGroesse

  def abstract()
    raise AbstractMethodError, "Subklassen muessen abstrakte Methoden implementieren"
  end

  def initialize(value = 0)
    @value = value
  end

  def value()
    return @value
  end

  def +(other)
    type_check(other)
    von_basis(in_basis + other.in_basis)
  end

  def -(other)
    type_check(other)
    von_basis(in_basis - other.in_basis)
  end

  def *(num)
    unless num.is_a?(Numeric)
      raise ArgumentError
    end
    von_basis(in_basis * num)

  end

  def /(num)
    unless num.is_a?(Numeric)
      raise ArgumentError
    end
    von_basis(in_basis / num)

  end

  def type_check(other)
    raise ArgumentError, "#{other} nicht vom Typ #{common_supertype()}" unless other.is_a?(common_supertype())
  end

  def common_supertype()
    abstract()
  end

  private :common_supertype

  def umrechnen_in()
    abstract()
  end

  private :umrechnen_in

  def to_s()
    "#{@value} #{symbol()}"
  end

  def symbol()
    abstract()
  end

  def in_basis()
    return @value * spezifischer_faktor.to_f
  end

  def spezifischer_faktor()
    abstract()
  end

  private :spezifischer_faktor

  def von_basis(wert)
    abstract()
  end

  private :von_basis

end

