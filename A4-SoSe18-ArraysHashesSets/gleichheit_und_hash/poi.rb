class POI
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def to_s()
    "#{@name}"
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return @name.eql? (other.name)
  end

  def hash()
    return @name.hash
  end
end