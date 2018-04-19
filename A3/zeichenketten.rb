class Zeichenketten

  def initialize()
  end


  def zeichen_ausgeben(zeichenkette)
    # i = 1
    # while i <= zeichenkette.length - 1
    #   zeichenkette.insert(i,' ')
    #   i += 2
    # end
    # print zeichenkette
    i = 0
    while i <= zeichenkette.length
      print "#{zeichenkette[i]} "
      i += 1
    end
  end


  def gerade_laenge?(zeichenkette)
    if zeichenkette.length % 2 == 0
      return true
    else
      return false
    end
  end


  def ungerade_laenge?(zeichenkette)
    if zeichenkette.length % 2 != 0
      return true
    else
      return false
    end
  end


  def drucke_dreieck1(zeichenkette)
    i = 1
    while i <= zeichenkette.length
      puts zeichenkette.slice(0..zeichenkette.length - i)
      i += 1
    end
  end


  def drucke_dreieck2(zeichenkette)
    i = 1
    while i <= zeichenkette.length
      (zeichenkette.length - i).times do
        print " "
      end
      puts zeichenkette.slice(0...i)
      i += 1
    end
  end


  def drucke_dreieck3(zeichenkette)
    if ungerade_laenge?(zeichenkette)
      i = 0
      while i < (zeichenkette.length / 2 + 1)
        i.times do
          print " "
        end
        puts zeichenkette.slice((i)...(zeichenkette.length - i))
        i += 1
      end
    else
      puts "Zeichenkette #{zeichenkette} hat ein gerade Länge. Die Methode arbeitet nur mit ungeraden Längen."
    end
  end

  def eieruhr(zeichenkette)
    drucke_dreieck3(zeichenkette)

    if ungerade_laenge?(zeichenkette)
      i = (zeichenkette.length / 2) - 1
      while i >= 0
        i.times do
          print " "
        end
        puts zeichenkette.slice((i)...(zeichenkette.length - i))
        i -= 1
      end
    else
      puts "Zeichenkette #{zeichenkette} hat ein gerade Länge. Die Methode arbeitet nur mit ungeraden Längen."
    end
  end


  def zeichenkette_aufpumpen(iterationen, zeichenkette2, praefix, suffix)
    if praefix < zeichenkette2.length && suffix < zeichenkette2.length
      neue_kette = zeichenkette2.slice(praefix...(zeichenkette2.length - suffix))
      i = 0
      iterationen.times do
        print zeichenkette2.slice(0...praefix)
        i.times do
          print neue_kette
        end
        puts zeichenkette2.slice(suffix...zeichenkette2.length)
        i += 1
      end
    else
      puts "Präfix und Suffix dürfen nicht größer als die Länge der Zeichenkette sein"
    end
  end

# kein richiges case-target?
  def naechstes_zeichen(ein_zeichen_string)
    # stelle in der ascii-tabelle (zahl)
    ord = ein_zeichen_string.ord
    case
      when ('0'..'9').include?(ein_zeichen_string)
        return ((ord - '0'.ord + 1) % 10 + '0'.ord).chr
      when ('a'..'z').include?(ein_zeichen_string)
        return ((ord - 'a'.ord + 1) % 26 + 'a'.ord).chr
      when ('A'..'Z').include?(ein_zeichen_string)
        return ((ord - 'A'.ord + 1) % 26 + 'A'.ord).chr
      else
        return nil
    end
    # case ein_zeichen_string
    #    when ('0'..'8').include?(ein_zeichen_string)
    #      return ein_zeichen_string.succ
    #    when ein_zeichen_string == "9"
    #     return "0"
    #    when ('a'..'y').include?(ein_zeichen_string)
    #      return ein_zeichen_string.succ
    #    when ein_zeichen_string == "z"
    #      return "a"
    #    when ('A'..'Y').include?(ein_zeichen_string)
    #      return ein_zeichen_string.succ
    #    when ein_zeichen_string == "Z"
    #     return "A"
    #    when ('0'..'9')
    #     ein_zeichen_string.chr
    #     when ('a'..'z')
    #     when ('A'..'Z')
    #   else
    #     return nil
    # end
  end
end

