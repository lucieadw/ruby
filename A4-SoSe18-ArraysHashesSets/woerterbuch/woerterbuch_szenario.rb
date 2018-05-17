require "./woerterbuch"
require "Set"

wb = Woerterbuch.new("DE", "ENG")


for w in %w{tall big huge large great wide long major grand }
  wb["gross"] = w
end

for w in %w{tall high exalted}
  wb["hoch"] = w
end


for w in %w{tall}
  wb["hochgewachsen"] = w
end

puts wb["gross"].to_a().to_s()
wb.formatiert_ausgeben()
puts wb.invertieren()

for w in %w{sublime august raised noble elevated grand exalted embossed lofty grand }
  wb["erhaben"] = w
end


for w in %w{huge enormous giant vast colossal mammoth monumental}
  wb["riesig"] = w
end
for w in %w{broad wide vast expanded extended}
  wb["breit"] = w
end
for w in %w{high tall up}
  wb["hoch"] = w
end
for w in %w{collected raised elevated exalted}
  wb["erhoben"] = w
end

for w in %w{elegant distinguished noble genteel}
  wb["vornehm"] = w
end

for w in %w{excellent distinguished outstanding}
  wb["ausgezeichnet"] = w
end
for w in %w{distinguish differentiate}
  wb["unterscheiden"] = w
end

for w in %w{differentiate define mark\ out}
  wb["abgrenzen"] = w
end

wb.formatiert_ausgeben()
wb.invertieren().formatiert_ausgeben()


puts "\nWort mit den meisten Übersetzungen"
puts wb.max_by {|_, val| val.size}[0]

puts "\nTabelle mit Quellwort und Anzahl der Übersetzungen"
p wb.map {|key, val| [key, val.size]}

puts "\nWort mit der kürzesten Übersetzung"
puts wb.min_by {|_, val| val.map {|elem| elem.length}.min}[0]

puts "\nSortieren alphabetisch absteigend nach Schlüssel"
p wb.sort().reverse()

puts "\nSortierung der Paare nach Anzahl der Übersetzungen und dann nach dem Schlüssel"
p wb.sort {|a, b|
  if a[1].size == b[1].size
    a[0] <=> b[0]
  else
    a[1].size <=> b[1].size
  end
}

puts "\nSortierung der Paare nach Schlüssel mit Sortierung der Wertemengen"
p wb.sort.map {|key, val| [key, val.sort]}

puts "\nAlle Uebersetzungen in einer Menge einsammeln"
p wb.inject(Set.new) {|acc, paar| acc.merge(paar[1])}.sort()

puts "\nAlle Übersetzungen der Länge 4 ohne Dubletten"
p wb.inject(Set.new) {|acc, paar| acc.merge(paar[1].find_all {|elem| elem.length == 4})}


puts "\nAlle deutschen Wörter zu dem englischen Wort tall ermitteln"
p wb.find_all {|_, v| v.include?("tall")}.map {|k, _| k}

puts "\nHaben alle Übersetzungen mindestens die Länge 2"
p wb.all? {|_, v| v.all? {|elem| elem.length >= 2}}

puts "\nGibt es eine Übersetung, die die Länge 10 hat"
p wb.any? {|_, v| v.any? {|elem| elem.length == 10}}

puts "\nAlle Schlüssel mit Präfix a oder hoch"
#select gleich find_all
p wb.select {|k, _| k.start_with?("a") || k.start_with?("hoch")}.map {|k, _| k}

puts "\nAlle Übersetzungen mit Präfix 'ma'"
p wb.invertieren().select {|k, _| k.start_with?("ma")}.map {|k, _| k}