class Workstation
  attr_accessor :username

  def initialize(monitor, rechner)
    @rechner = rechner
    @monitor = monitor
  end

  def gib_rechner()
   return @rechner
  end

  def gib_monitor()
    return @monitor
  end

  def gib_graka_marke()
    return @rechner.gib_grafikkartenhersteller()
  end

  def gib_freien_festplattenspeicher()
return @rechner.gib_festplattenspeicher()
  end

  def vr_ready?()
    return @rechner.grafik_vr()
  end

  def preis()
    return @rechner.preis() + @monitor.preis()
  end
  def hersteller()
    return @rechner.gib_hersteller
  end


end