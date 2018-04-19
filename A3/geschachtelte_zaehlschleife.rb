class Geschachtelte_Zaehlschleife

  def initialize()
  end

  def teiler_muster_ausgeben(zeilen, spalten)
    1.upto(zeilen) do |zeile|
      1.upto(spalten) do |spalte|
        if spalte % zeile == 0 || zeile % spalte == 0
          print "♥"
    # for zeile in 1..zeilen
    #   for spalte in 1..spalten
    #     if spalte % zeile == 0 || zeile % spalte == 0
    #            print "*"
        else
        print " "
      end
    end
    puts
  end
end
end
