class Modulo

  def initialize()
    @wochentage = %w(Sonntag Montag Dienstag Mittwoch Donnerstag Freitag Samstag)
  end

  # Basis wird hier nicht gebraucht?
  def to_string(zahl)

    if zahl <= 10
      return zahl.to_s

    elsif zahl > 10
      ("A".ord() - 10) + zahl
    end
  end

  def zahl_umwandeln(dez_zahl, in_basis)
    kette = ""
    erg = dez_zahl
    while erg > 0
      rest = erg % in_basis
      kette << to_string(rest)
      erg = erg / in_basis
    end
    return kette.reverse
  end

  def wochentag_berechnen(tag, monat, jahr)
    j0 = jahr - (14 - monat) / 12
    x = j0 + j0 / 4 - j0 / 100 + j0 / 400
    m0 = monat + 12 * ((14 - monat) / 12) - 2
    t0 = (tag + x + (31 * m0) / 12) % 7
    return @wochentage[t0]

  end
end
