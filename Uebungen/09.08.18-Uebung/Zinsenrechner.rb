def konstante_abzahlung(betrag, laufzeit, zinssatz, speicher = [])
  rate = betrag / laufzeit
  if laufzeit < 0
  raise ArgumentError
  end
  if laufzeit == 0
    return speicher
  end
  speicher << betrag * (zinssatz / 100.0)
  return konstante_abzahlung(betrag - rate, laufzeit - 1, zinssatz, speicher)
end

def konstante_abzahlung_rek(betrag, laufzeit,zinssatz)
  if laufzeit < 0
    raise ArgumentError, "Fehlerhafte Laufzeit"
  end
  rate = betrag / laufzeit
  speicher = Array.new()
  if laufzeit == 0
    return speicher
  end
  speicher << betrag * (zinssatz / 100.0)
  return speicher + konstante_abzahlung_rek(betrag - rate, laufzeit - 1, zinssatz)
end

def konstante_abzahlung_iter(betrag, laufzeit, zinssatz)
  erg = []
  rate = betrag / laufzeit
  laufzeit.times do
    erg << (betrag *(zinssatz / 100.0))
    betrag -= rate
  end
  return erg
end

p konstante_abzahlung(100000.0, 10.0, 5)
puts "iteration"
p konstante_abzahlung_iter(100000.0, 10, 5)
puts
p konstante_abzahlung_rek(100000.0, 0, 5)