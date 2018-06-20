require "matrix"
require_relative './einfache_groesse'

module LaengenMass
  include EinfacheGroesse

  def common_supertype()
    return LaengenMass
  end

  def to_s()
    if value.is_a?(Vector)
      return "#{value.magnitude} (#{value[0]},#{value[1]}) #{symbol}"
    else
      return super.to_s
    end
  end
end

class Kilometer
  include LaengenMass

  def spezifischer_faktor()
    return 1000000
  end

  def symbol
    return :km
  end
end

class Meter
  include LaengenMass

  def spezifischer_faktor()
    return 1000
  end

  def symbol
    return :m
  end
end

class Zentimeter
  include LaengenMass

  def spezifischer_faktor()
    return 10
  end

  def symbol
    return :cm
  end
end

class Millimeter
  include LaengenMass

  def spezifischer_faktor()
    return 1
  end

  def symbol
    return :mm
  end
end