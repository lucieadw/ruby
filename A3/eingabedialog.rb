class Eingabedialog

  def initialize()

  end

  def einfacher_eingabe_addierer()
    sum = 0
    while true
      puts "Bitte geben Sie eine Zahl für einen einfachen Addierer ein. Mit exit können Sie den Addierer beenden."
      eingabe = normalisieren(gets.chomp)
      if eingabe.to_f.to_s == eingabe && eingabe.to_f >= 0
        print "Sum_alt = #{sum} Zahl = #{eingabe}"
        sum = sum + eingabe.to_f
        puts " Sum_neu = #{sum}"
      elsif eingabe == "exit"
        puts "Bis zum nächsten Mal!"
        break
      else
        eingabe.to_f <= 0
        puts "Eingabe #{eingabe} ist ungültig. Bitte geben Sie eine positive Zahl ein!"
      end
    end
  end

  def normalisieren(input)
    input.downcase.strip
  end
end

