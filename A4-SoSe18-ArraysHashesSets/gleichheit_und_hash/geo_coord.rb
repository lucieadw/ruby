class GeoCoord

  attr_reader :region, :breiten_grad, :laengen_grad

  def initialize(region, breiten_grad, laengen_grad)
    @region = region
    @breiten_grad = breiten_grad
    @laengen_grad = laengen_grad
  end

  def to_s()
    "#{@region}: #{@breiten_grad} #{@laengen_grad}"
  end

end

class Grad
  attr_reader :himmels_richtung, :grad, :minuten, :sekunden, :dezimal_sekunden

  def initialize(himmels_richtung, grad, minuten, sekunden, dezimal_sekunden)
    @himmels_richtung = himmels_richtung
    @grad = grad
    @minuten = minuten
    @sekunden = sekunden
    @dezimal_sekunden = dezimal_sekunden
  end

  def to_s()
    "#{@himmels_richtung} #{@grad}°#{@minuten}'#{@sekunden}.#{@dezimal_sekunden}\""
  end

end

