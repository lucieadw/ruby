require_relative "./laengen_mass"
require_relative "./zeit_groesse"
require_relative "./geschwindigkeit"
require "matrix"

km = Kilometer.new(Vector[4,3])
km1 = Kilometer.new(Vector[3,4])
m = Meter.new(Vector[-4000,3000])
m1 = Meter.new(Vector[-4000,-3000])

puts km
puts km1
puts m

# #etc Analog für die Zeitgrößen

puts "Kombinierte Größe"
puts g =   Geschwindigkeit.new(km,Stunde.new(1))
puts g1 =  Geschwindigkeit.new(m,Stunde.new(1))
puts g2 =  Geschwindigkeit.new(km1,Stunde.new(1))
puts g3 = Geschwindigkeit.new(m1,Stunde.new(1))

puts "Addition"
puts g+g1
puts g+g2
puts g +g3
puts g1+g2