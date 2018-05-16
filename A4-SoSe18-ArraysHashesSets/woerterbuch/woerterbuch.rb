require "Set"

class Woerterbuch
  include Enumerable

  def initialize(quelle, ziel)
    @verzeichnis = {}
    @quelle = quelle
    @ziel = ziel
  end

  def []=(quelle, ziel)
    if @verzeichnis.has_key?(quelle)
      @verzeichnis[quelle] << ziel
    else
      @verzeichnis[quelle] = Set.new([ziel])
    end
  end

  def [](quelle)
    if !@verzeichnis.has_key?(quelle)
      raise ArgumentError, "Zum Wort '#{quelle}' existieren keine Übersetzungen."
    else
      return @verzeichnis[quelle]
    end
  end

  def each
    @verzeichnis.each do |paar|
      yield paar
    end
  end

  def invertieren()
    neu_wb = Woerterbuch.new(@ziel, @quelle)
    each {|key, val|
      val.each {|elem|
        neu_wb[elem] = key
      }
    }
    return neu_wb
  end

  def formatiert_ausgeben()
    max_wort = @verzeichnis.keys().map {|key| key.length}.max()

    puts "Wörterbuch #{@quelle} => #{@ziel}"
    @verzeichnis.each_key {|key|
      printf("%-#{max_wort}s => #{@verzeichnis[key].first}\n", key)
      @verzeichnis[key].drop(1).each {|elem|
        # +4 weil der '=>' 4 stellen einnimmt
        puts " ".ljust(max_wort + 4) + elem
      }
    }
  end

  def to_s()
    "Wörterbuch #{@quelle} => #{@ziel}: #{@verzeichnis.inspect()}"
  end
end

