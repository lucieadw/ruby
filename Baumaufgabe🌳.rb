class Knoten

    attr_reader :wert

    def initialize(wert)
        @wert = wert
        @kinder = []
    end

    def <<(kind)
        @kinder << kind
        self
    end

    def each(&block)
        # TODO
    end

    def to_s
        "#{self.class}={Wert=#{@wert}, Kinder=[#{@kinder.join("; ")}]}"
    end
end

wurzel = Knoten.new("Eukaryoten")
kind1 = Knoten.new("Pflanzen")
wurzel << kind1
kind101 = Knoten.new("Farne")
kind1 << kind101
kind2 = Knoten.new("Pilze")
wurzel << kind2
kind3 = Knoten.new("Tiere")
wurzel << kind3
kind301 = Knoten.new("Säugetiere")
kind3 << kind301
kind3011 = Knoten.new("Raubtiere")
kind301 << kind3011
kind30111 = Knoten.new("Hundeartige")
kind3011 << kind30111
kind301111 = Knoten.new("Waschbär")
kind30111 << kind301111
kind302 = Knoten.new("Fische")
kind3 << kind302
kind303 = Knoten.new("Reptilien")
kind3 << kind303
kind3031 = Knoten.new("Gecko")
kind303 << kind3031

# Die Klasse Knoten iterierbar machen
# Alle Lebensformen alphabetisch im Array sortieren
#     => ["Eukaryoten", "Farne", "Fische", "Gecko", "Hundeartige", "Pflanzen", "Pilze", "Raubtiere", "Reptilien", "Säugetiere", "Tiere", "Waschbär"]
# Anzahl aller Kindknoten zu jedem Knoten ausgeben
#     => [0, [1, [2]], [1], [1, [2, [3, [4, [5]]]], [2], [2, [3]]]]

class Knoten
    def alphabetisch
        # TODO
    end

    def tiefe
        # TODO
    end    
end

p wurzel.alphabetisch
p wurzel.tiefe
