require_relative 'teig.rb'

class Fuellung

  def initialize()
    @fuellung = %w(Himbeere Schokolade Karamell Rum Sahne Vanille Erdbeere).sample
    @teig = Teig.new
  end

  def to_string
     "Füllung mit Geschmack #{@fuellung} und #{@teig.to_string}"
  end
end