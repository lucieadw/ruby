class Array_test
  def initialize(ary)
    @laengstes_elem = ary.flatten().max_by() {|elem| elem.to_s().size()}.to_s().size()
    @laengster_zeilen_index = (ary.size() - 1).to_s().size()
    @laengster_spalten_index = (ary.max_by() {|elem| elem.size()}).to_s().size()
  end

  def ary_2dim?(ary)
    unless ary.is_a?(Array)
      return false
    end
    ary.all?() {|elem| elem.is_a?(Array) && elem.all?() {|elem2| !elem2.is_a?(Array)}}
  end

  def tiefe_kopie(original)
    unless ary_2dim?(original)
      # Geht auch kurz: return ary.map {|elem| elem.map {|elem2| elem2}}
      raise ArgumentError, "Kein 2dim"
    end
# Array ist unregelmäßig unterschiedliche länge der Zeilen
    kopie = Array.new()

    for i in (0..original.size() - 1)
      # erzeugen Zeilen Array für jede Zeile(brauch man in Ruby eig nicht, weil man die länge des Arrays nicht vorher bestimmen muss )
      zeilen_laenge = original[i].size()
      kopie[i] = Array.new(zeilen_laenge)
      for j in (0..zeilen_laenge - 1)
        # Übertragen der ELemente von original in Kopie
        kopie[i][j] = original[i][j]
      end
    end
    return kopie
  end

  def flache_kopie(original)
    unless ary_2dim?(original)
      raise ArgumentError, "Kein 2dim"
    end
    kopie = Array.new()
    for i in (0...original.size)
      kopie[i] = original[i]
    end
    return kopie
  end

  ###############################################################################################################

  def drucke_2d(ary, platz_pro_elem)
    unless ary_2dim?(ary)
      raise ArgumentError, "Kein 2dim"
    end
    ary.each {|zeile|
      zeile.each {|elem|
        printf("%#{platz_pro_elem}s", elem)
        puts
      }
    }
  end

  def drucke_2d_cool(ary)
    laengstes_element = groesse_bestimmen(ary)
    drucke_spalten_indizes(ary, laengstes_element)
    drucke zeilen(ary, laengstes_element)
  end

  def drucke_spalten_indizes(ary)
    for spalten_index in (0...ary.size())
      printf("%#{@laengster_spalten_index}s", spalten_index)


    end
  end

  def drucke_zeilen(ary)
    for zeilen_index in (0...ary.size())
      printf("%#{@laengster_zeilen_index}s", zeilen_index)


    end
  end

  def groesse_bestimmen()
    return [@laengstes_elem, @laengster_zeilen_index, @laengster_spalten_index].max()
  end

end


#srand(9999)

#ary1 = [[1], [3], [40]]

#puts ary_2dim?(ary1)

#puts tiefe_kopie(ary1).to_s

#puts flache_kopie(ary1).to_s


# Überprüfung ob tiefe kopie
#p ary1 #original
#x = tiefe_kopie(ary1)
#p x
#x[0][0] = 9999 #verändere die kopie
#p ary1
##p x


#puts
# Überprüfung ob flache kopie
#p ary1 #original
#x = flache_kopie(ary1)
#p x
#x[0][0] = 9999 #verändere die kopie
#p ary1
#p x

ary_drucke = [[11], [5], [4]]
a = Array_test.new(ary_drucke)


a.drucke_2d(ary_drucke, 5)