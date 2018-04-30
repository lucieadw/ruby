require_relative 'rechnen.rb'
require_relative 'modulo.rb'
require_relative 'zufallszahlen.rb'
require_relative 'geschachtelte_zaehlschleife.rb'
require_relative 'zeichenketten.rb'
require_relative 'eingabedialog.rb'
require_relative 'kuchen.rb'
require_relative 'fuellung.rb'
require_relative 'teig.rb'


class Main
  def initialize()
  end

  def ausfuehrung
    puts "Welches Programm soll starten? [Rechnen, Modulo, Zufallszahlen, Zaehlschleife, Zeichenketten, Eingabedialog, Kuchen backen]"
    programm = gets.chomp.downcase.strip
    puts "Okay, #{programm}!"
    case programm

      when "rechnen"

        r = Rechnen.new()

        puts "Summe der Quadratzahlen bis zu welcher Zahl?"
        n = gets.chomp.to_i
        puts "Summe: " + r.sum_quadrat(n).to_s

        puts "Harmonische Reihe bis zu welcher Zahl?"
        n = gets.chomp.to_i
        puts "Summe: " + r.harmonisch(n).to_s

        puts "Wert zur Näherung an den Logarithmus von 2: "
        n = gets.chomp.to_i
        puts "Näherung: " + r.naeherung_log2(n).to_s

        puts "Welche Abweichung von der Näherung zum log(2) soll geduldet werden?"
        eps = gets.chomp.to_f
        puts "Mit diesem Wert, ist die Abweichung kleiner als die Vorgegebene: " + r.n_fuer_eps_kleiner(eps).to_s

      when "modulo"

        m = Modulo.new
        print "Welche Zahl? "
        zahl = gets.chomp.to_i
        puts m.to_string(zahl).to_s

        dez_zahl = gets.chomp.to_i
        in_basis = gets.chomp.to_i
        puts "Zeichenkette: " + m.zahl_umwandeln(dez_zahl, in_basis).to_s

        print "Tag (als Zahl): "
        tag = gets.chomp.to_i
        print "Monat (als Zahl): "
        monat = gets.chomp.to_i
        print "Jahr: "
        jahr = gets.chomp.to_i

        puts "An diesem Datum ist: " + m.wochentag_berechnen(tag, monat, jahr).to_s

      when "zufallszahlen"

        z = Zufallszahlen.new()

        print "Intervallstart:"
        start = gets.chomp.to_i
        print "Intervallende:"
        ende = gets.chomp.to_i
        print "Gesuchte Zahl:"
        ziel_zahl = gets.chomp.to_i
        z.versuche_fuer_zahl_im_intervall(start, ende, ziel_zahl)

      when "zaehlschleife"

        gz = Geschachtelte_Zaehlschleife.new()

        zeilen = gets.chomp.to_i
        spalten = gets.chomp.to_i
        gz.teiler_muster_ausgeben(zeilen, spalten).to_s

      when "zeichenketten"

        zk = Zeichenketten.new()

        print "Gib eine Zeichenkette ein:"
        zeichenkette = gets.chomp
        puts
        puts zk.zeichen_ausgeben(zeichenkette)
        print "Hat die Zeichenkette eine gerade Länge? "
        puts zk.gerade_laenge?(zeichenkette)
        print "Hat die Zeichenkette eine ungerade Länge? "
        puts zk.ungerade_laenge?(zeichenkette)
        puts
        zk.drucke_dreieck1(zeichenkette)
        puts
        zk.drucke_dreieck2(zeichenkette)
        puts
        zk.drucke_dreieck3(zeichenkette)
        puts
        zk.eieruhr(zeichenkette)
        puts
        print "Wie oft soll iteriert werden? "
        iterationen = gets.chomp.to_i
        print "Über welche Zeichenkette? "
        zeichenkette2 = gets.chomp
        print "Wie lang soll der Präfix sein? "
        praefix = gets.chomp.to_i
        print "Wie lang soll der Suffix sein? "
        suffix = gets.chomp.to_i
        zk.zeichenkette_aufpumpen(iterationen, zeichenkette2, praefix, suffix)


        print "Nach -> "
        ein_zeichen_string = gets.chomp
        print "kommt -> "
        puts zk.naechstes_zeichen(ein_zeichen_string)

      when "eingabedialog"

        e = Eingabedialog.new()
        e.einfacher_eingabe_addierer

      when "kuchen backen"
        k = Kuchen.new
        puts k.backen.to_s

      else
        puts "Fehler! Bitte wähle eines der oben aufgeführten Programme oder überprüfe deine Rechtschreibung :)"
    end
  end
end
main = Main.new
main.ausfuehrung
