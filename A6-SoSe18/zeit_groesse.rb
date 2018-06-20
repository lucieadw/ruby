require "matrix"
require_relative './einfache_groesse'

module ZeitGroesse
  include EinfacheGroesse

  def common_supertype()
    return ZeitGroesse
  end
end

class Stunde
  include ZeitGroesse

  def spezifischer_faktor()
    return (60 * 60 * 1000)
  end

  def symbol
    return :h
  end
end

class Minute
  include ZeitGroesse

  def spezifischer_faktor()
    return (60 * 1000)
  end

  def symbol
    return :min
  end
end

class Sekunde
  include ZeitGroesse

  def spezifischer_faktor()
    return 1000
  end

  def symbol
    return :s
  end
end

class Millisekunde
  include ZeitGroesse

  def spezifischer_faktor()
    return 1
  end

  def symbol
    return :ms
  end
end