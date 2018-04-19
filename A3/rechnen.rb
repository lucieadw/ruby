class Rechnen

  def initialize()
  end

  def sum_quadrat(n)
    i = 1
    sum = 0
    n.times do
      sum += i ** 2
      i += 1
    end
    return sum
  end

  def harmonisch(n)
    i = 1
    sum = 0
    n.times do
      sum += 1.0 / i
      i += 1
    end
    return sum
  end

  def naeherung_log2(n)
    i = 1
    sum = 0.0
    n.times do
      sum += (-1.0) ** (i + 1.0) / i
      i += 1
    end
    return sum
  end

  def n_fuer_eps_kleiner(eps)
    n = 1
    while (naeherung_log2(n) - Math.log(2)).abs > eps
      n += 1
    end
    return n
  end
end



