class Taschenrechner

  def initialize
    @wuerfel = Random.new
  end

  def addiere(summand1, summand2)
    (summand1.to_i + summand2.to_i)

  end

  def subtrahiere(sub1, sub2)
    (sub1.to_i - sub2.to_i)
  end

  def dividiere(div1, div2)
    (div1.to_i / div2.to_i)

  end

  def multipliziere(mul1, mul2)
    (mul1.to_i * mul2.to_i)

  end

  def modulo(div1, div2)
    erg1 = (div1.to_i / div2.to_i)
    erg2 = (erg1.to_i * div2.to_i)
    erg3 = (div1.to_i - erg2.to_i)

  end

  def glatt(div1, div2)
    modulo(div1, div2) == 0

  end

  def potenz(bas, exp)

    erg = 1
    if exp > 0
      exp.times do
        erg = erg * bas
      end
    elsif exp == 0
      return 1

    else
      erg = 1.0 / potenz(bas, exp * -1)
    end
    erg
  end

  def kgv (z1, z2)
    if z1 * z2 == 0
      puts "Bitte geben Sie einen gültigen Wert ein (nicht 0)"
    else
      t1 = z1
      while t1 % z2 != 0
        t1 = t1 + z1
      end
      t1
    end
  end

  def wuerfeln (seiten)
    @wuerfel.rand(1..seiten)
  end

end

var = Taschenrechner.new


print "Operand 1: "
operand1 = gets.chomp.to_i

print "Operator: "
operator = gets.chomp

print "Operand 2: "
operand2 = gets.chomp.to_i

print "Ergebnis = "
if operator == "+"
  puts var.addiere(operand1, operand2).to_s
elsif operator == "-"
  puts var.subtrahiere(operand1, operand2).to_s
elsif operator == "*"
  puts var.multipliziere(operand1, operand2).to_s
elsif operator == "/"
  puts var.dividiere(operand1, operand2).to_s
elsif operator == "%"
  puts var.modulo(operand1, operand2).to_s
elsif operator == "glatt teilbar"
  puts var.glatt(operand1, operand2).to_s
elsif operator == "**"
  puts var.potenz(operand1, operand2).to_s
elsif operator == "kgv"
  puts var.kgv(operand1, operand2).to_s
else
  puts "Kenn ich nicht!"
end

puts "Würfeln"

seiten = gets.chomp.to_i
puts "Du hast " + var.wuerfeln(seiten).to_s + " gewürfelt!"