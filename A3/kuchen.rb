require_relative 'fuellung.rb'
require_relative 'teig.rb'

class Kuchen

  def initialize()
    @fuellung = Fuellung.new
    @top_farbe = %w(rosa blau grün gelb weiß schwarz).sample
  end

  def backen
    a = "Der Kuchen hat eine #{@fuellung.to_string}. Sein Topping ist #{@top_farbe}."
    if @fuellung.to_string.include?("Rum")
     return a + "\nNichts für den Kindergeburtstag, erst ab 18!"
    else
      return a + "\nGuten Appetit!"
    end
  end
end





