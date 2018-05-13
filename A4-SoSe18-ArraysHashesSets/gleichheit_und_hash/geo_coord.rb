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

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return [@region, @breiten_grad, @laengen_grad].eql?([other.region, other.breiten_grad, other.laengen_grad])
  end

  def ==(other)
      return eql?(other)
  end

  def hash()
    return @region.hash + @breiten_grad.hash + @laengen_grad.hash
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

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return [@himmels_richtung, @grad, @minuten,@sekunden,@dezimal_sekunden]
               .eql?([other.himmels_richtung, other.grad, other.minuten,other.sekunden,other.dezimal_sekunden])
  end

  def hash()
    return @himmels_richtung.hash + @grad.hash + @minuten.hash + @sekunden.hash + @dezimal_sekunden.hash
  end
end

