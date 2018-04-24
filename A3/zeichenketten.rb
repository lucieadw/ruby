class Zeichenketten

  def initialize()
  end


  def zeichen_ausgeben(zeichenkette)
    zeichenkette.length.times do |i|
      print "#{zeichenkette[i]} "
    end
    puts
  end


  def gerade_laenge?(zeichenkette)
    return zeichenkette.length % 2 == 0
  end


  def ungerade_laenge?(zeichenkette)
    return !gerade_laenge?(zeichenkette)
  end


  def drucke_dreieck1(zeichenkette)
    for i in 1..zeichenkette.length
      puts zeichenkette.slice(0..zeichenkette.length - i)
    end
  end


  def drucke_dreieck2(zeichenkette)
    for i in 1..zeichenkette.length
      (zeichenkette.length - i).times do
        print " "
      end
      puts zeichenkette.slice(0...i)
    end
  end


  def drucke_dreieck3(zeichenkette)
    if ungerade_laenge?(zeichenkette)
      for i in 0..(zeichenkette.length / 2)
        i.times do
          print " "
        end
        puts zeichenkette.slice((i)...(zeichenkette.length - i))
      end
    else
      puts "Zeichenkette #{zeichenkette} hat ein gerade Länge. Die Methode arbeitet nur mit ungeraden Längen."
    end
  end

  def eieruhr(zeichenkette)
    drucke_dreieck3(zeichenkette)

    if ungerade_laenge?(zeichenkette)
      ((zeichenkette.length / 2) - 1).downto(0) {|i|
        i.times do
          print " "
        end
        puts zeichenkette.slice((i)...(zeichenkette.length - i))
      }
    end
  end


  def zeichenkette_aufpumpen(iterationen, zeichenkette2, praefix, suffix)
    if praefix < zeichenkette2.length && suffix < zeichenkette2.length
      neue_kette = zeichenkette2.slice(praefix...(zeichenkette2.length - suffix))
      iterationen.times do |i|
        print zeichenkette2.slice(0...praefix)
        i.times do
          print neue_kette
        end
        puts zeichenkette2.slice(suffix...zeichenkette2.length)
      end
    else
      puts "Präfix und Suffix dürfen nicht größer als die Länge der Zeichenkette sein"
    end
  end

  def naechstes_zeichen(ein_zeichen_string)
    # stelle in der ascii-tabelle (zahl)
    ord = ein_zeichen_string.ord
    case ord
      when ('0'.ord..'9'.ord)
        return ((ord - '0'.ord + 1) % 10 + '0'.ord).chr
      when ('a'.ord..'z'.ord)
        return ((ord - 'a'.ord + 1) % 26 + 'a'.ord).chr
      when ('A'.ord..'Z'.ord)
        return ((ord - 'A'.ord + 1) % 26 + 'A'.ord).chr
      else
        return nil
    end
  end
end

