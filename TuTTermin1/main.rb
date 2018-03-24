require_relative 'datastructures/grafikkarte'
require_relative 'datastructures/festplatte'
require_relative 'datastructures/monitor'
require_relative 'datastructures/prozessor'
require_relative 'datastructures/rechner'
require_relative 'datastructures/workstation'


gk = Grafikkarte.new("Nvidia", 2048, true, "GTX 1070",333)
pr = Prozessor.new("Intel", 4, 3.4, 300)
fp = Festplatte.new("Intel", 1024, 150,112)
mn = Monitor.new("Samsung", 24,80)
re = Rechner.new("Dell", fp, gk, pr)
ws = Workstation.new(mn, re)
ws.username = "Lucie"

puts "Hallo! Ich bin dein Rechner, was willst du über mich wissen?"
puts "Schreib 'Hilfe!', um in Erfahrung zu bringen was ich dir über mich sagen kann!"
puts "Schreib 'Exit', um die Fragerunde zu beenden."
begin
  eingabe = gets.chomp
  case eingabe.downcase
    when "hilfe!"
      puts "'vr ready?' > Wenn du wissen willst, ob ich VR(Virtual Reality) kann."
      puts "'freier Festplattenspeicher' > Wenn du wissen willst, wie viel freien Speicher ich noch habe."
      puts "'preis' > Wenn du wissen willst wie teuer ich bin"
    puts "'hersteller' > Welche Hersteller haben an mir mitgearbeitet"
    when "vr ready?"
      puts ws.vr_ready?.to_s
    when "freier festplattenspeicher"
      puts ws.gib_freien_festplattenspeicher.to_s
    when "preis"
      puts ws.preis.to_s
    when "hersteller"
      puts ws.hersteller.to_s
    else
      puts "Ich hab dich nicht verstanden. "
      puts "Schreib 'Hilfe!', um in Erfahrung zu bringen was ich dir über mich sagen kann!"
  end
end until eingabe.downcase == "exit"