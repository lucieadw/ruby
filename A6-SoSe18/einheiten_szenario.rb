require_relative "./laengen_mass"
require_relative "./zeit_groesse"
require_relative "./geschwindigkeit"
require "matrix"

km = Kilometer.new(5)
m = Meter.new(7)
cm = Zentimeter.new(100)
mm = Millimeter.new(345)

puts "Addition und Subtraktion"
puts km + m
puts m - cm
puts cm -mm
puts m - mm
# etc Analog für die Zeitgrößen

puts "Multiplikation und Division"
puts km * 5
puts m * 23
#etc Analog für die Zeitgrößen

puts "Umrechnen"
puts km.umrechnen_in(Meter)
puts m.umrechnen_in(Kilometer)
puts km.umrechnen_in(Millimeter)
#etc
st = Stunde.new(3)
min = Minute.new(6)
sec = Sekunde.new(45)
msec = Millisekunde.new(125)

puts st.umrechnen_in(Minute)
puts min.umrechnen_in(Sekunde)
puts st.umrechnen_in(Millisekunde)

puts "Kombinierte Größe"
puts g = Geschwindigkeit.new(Kilometer.new(5), Stunde.new(1))
puts g1 = Geschwindigkeit.new(Meter.new(13), Sekunde.new(60))

puts "Addition und Subtraktion"
puts g + g1
puts g - g1
puts g
puts "Multiplikation und Division"
puts g * 13
puts g1 / 10

puts "Umrechnen"
puts g.umrechnen_in(Meter, Stunde)
puts g.umrechnen_in(Meter, Minute)
puts g2 = g.umrechnen_in(Meter, Sekunde)
puts g2.umrechnen_in(Meter, Minute)
puts g2.umrechnen_in(Meter, Stunde)
puts g2.umrechnen_in(Kilometer, Stunde)


# Und nun mit Vektoren
puts "UND NUN MIT VEKTOREN"
km = Kilometer.new(Vector[5, 0])
m = Meter.new(Vector[7, 0])
cm = Zentimeter.new(Vector[100, 0])
mm = Millimeter.new(Vector[345, 0])

puts "Addition und Subtraktion"
puts km + m
puts m - cm
puts cm -mm
puts m - mm

puts "Multiplikation und Division"
puts km * 5
puts m * 23

puts "Umrechnen"
puts km.umrechnen_in(Meter)
puts m.umrechnen_in(Kilometer)
puts km.umrechnen_in(Millimeter)

puts "Kombinierte Größe"
puts g = Geschwindigkeit.new(Kilometer.new(5), Stunde.new(1))
puts g1 = Geschwindigkeit.new(Meter.new(13), Sekunde.new(60))

puts "Addition und Subtraktion"
puts g + g1
puts g - g1
puts "Multiplikation und Division"
puts g * 13
puts g1 / 10

puts "Umrechnen"
puts g.umrechnen_in(Meter, Stunde)
puts g.umrechnen_in(Meter, Minute)
puts g2 = g.umrechnen_in(Meter, Sekunde)
puts g2.umrechnen_in(Meter, Minute)

