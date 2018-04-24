class Zufallszahlen

  def initialize()
  end

  def versuche_fuer_zahl_im_intervall(start, ende, ziel_zahl)
    if start.integer? && ende.integer? && ziel_zahl.integer?
      versuche = 0
      min = ende
      max = start
      begin
      zahl = rand(start..ende)
      versuche += 1
      if zahl > max
        max = zahl
      elsif zahl < min
        min = zahl
        end
        end until zahl == ziel_zahl
      puts "Versuche für #{ziel_zahl} in #{start}..#{ende}: Min.: #{min}  Max.: #{max}  Versuche: #{versuche}"
    else
      puts "Fehler.Aurgumente müssen ganze Zahlen sein."
    end
  end
  end



