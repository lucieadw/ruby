tiere = ["Pferd","Hund","Esel","Katze","Tiger","Elefant","Schnabeltier","Igel","Zebra","Kuh","Elster","Büffel","Stirnlappenbasilisk"]

# Wie viele Wörter fangen mit 'E' an; kein each oder inject! => 3
# Wie viele Wörter sind länger als 5 chars; KEIN INJECT! => 5
# Längstes Wort und seine Länge als Paar => [19,"Stirnlappenbasilisk"]
# Sortieren nach dem letzten Buchstaben im Wort
# Nach Anfangsbuchstaben gruppieren
# Nach Anfangsbuchstaben gruppiert zählen

zoo = {:tropen_haus=>["Python","Vogelspinne","Fledermaus","Pfeilgiftfrosch","Kolobri"],
       :safari_park=>["Elefant","Giraffe","Zebra","Gazelle","Löwe","Hyäne","Geier"],
       :streichel_zoo=>["Ziege","Kaninchen","Meerschweinchen","Huhn"],
       :vogel_haus=>["Adler","Flamingo","Condor","Gans","Haubentaucher","Papagei","Uhu","Tucan","Ara"]}

# Wie viele Tiere hat der Zoo => 25
# Alle Tiere als sortiertes Array (aufsteigend alphabetisch).
# Alle Tiere als sortiertes Array (aufsteigend nach Länge des Wortes).
# Wie viele Tiere mit einem 'i' im Namen; OHNE INJECT!; versuche flat_map zu benutzen => 10

class Hero

    attr_accessor :name,:hp

    def initialize(name, hp)
        @name = name
        @hp = hp
    end

end

dota = {:strength=>{
            :carry=>[Hero.new("Sven",750),Hero.new("Lycan",700)],
            :support=>[Hero.new("Io",500),Hero.new("Earthshaker",650)]
        },
        :agility=>{
            :carry=>[Hero.new("Antimage",550),Hero.new("Luna",550),Hero.new("Phantom Assassin",500)],
            :support=>[Hero.new("Mirana",500),Hero.new("Venomancer",525)]
        },
        :intelligence=>{
            :carry=>[Hero.new("Storm Spirit",500),Hero.new("Invoker",450)],
            :support=>[Hero.new("Enchantress",400),Hero.new("Rubick",450),Hero.new("Puck",425)]
        }}

# Wie viele Helden gibt es => 14
# Alle Helden absteigend nach HP, Namen sortieren
# Alle Helden nach :carry und :support neu zusammenfassen (flacher Hash); {:carry=>[...],:support=>[...]}
# HP pro Attributkategorie summieren
# Alle Heldennamen, alphabetisch sortiert, zu einem String joinen => "AntimageEnchantress..."
