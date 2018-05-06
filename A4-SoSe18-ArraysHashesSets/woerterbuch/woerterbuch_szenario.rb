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
  wb["ausgezeichnet"] =w
end
 for w in %w{distinguish differentiate}
   wb["unterscheiden"] = w
 end

for w in %w{differentiate define mark\ out}
  wb["abgrenzen"] = w
end

wb.formatiert_ausgeben()
wb.invertieren().formatiert_ausgeben()

# TODO Wort mit den meisten Übersetzungen
# TODO Tabelle mit Quellwort und Anzahl der Übersetzungen
# TODO Wort mit der kürzesten Übersetzung
# TODO Sortieren alphabetisch absteigend nach Schlüssel
# TODO Sortierung der Paare nach Anzahl der Übersetzungen und dann nach dem Schlüssel
# TODO Sortierung der Paare nach Schlüssel mit Sortierung der Wertemengen
# TODO Alle Uebersetzungen in einer Menge einsammeln
# TODO Alle Übersetzungen der Länge 4 ohne Dubletten
# TODO Alle deutschen Wörter zu dem englischen Wort tall ermitteln
# TODO Haben alle Übersetzungen mindestens die Länge 2
# TODO Gibt es eine Übersetung, die die Länge 10 hat
# TODO Alle Schlüssel mit Präfix a oder hoch"
# TODO Alle Übersetzungen mit Präfix "ma"

