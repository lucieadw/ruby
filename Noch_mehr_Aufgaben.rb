class AstroBody

    attr_reader :name, :size, :mass, :distance, :moons

    def initialize(name, size, mass, distance, moons)
        raise ArgumentError("Name must be a String.") unless name.is_a?(String)
        raise ArgumentError("Size must be a Float.") unless size.is_a?(Float)
        raise ArgumentError("Mass must be a Float.") unless mass.is_a?(Float)
        raise ArgumentError("Distance must be a Float.") unless distance.is_a?(Float)
        raise ArgumentError("Moons must be an Array.") unless moons.is_a?(Array)
        @name = name
        @size = size
        @mass = mass
        @distance = distance
        @moons = moons
    end

end
