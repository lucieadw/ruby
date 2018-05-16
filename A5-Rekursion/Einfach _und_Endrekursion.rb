def quadrat_rekursiv(n)
  if n < 1
    return nil
  end
  if n == 1
    return 1
  end
  return quadrat_rekursiv(n - 1) + n ** 2
end

def quadrat_endrek(n, sum = 1)
  if n < 1
    return nil
  end
  if n == 1
    return sum
  end
  sum += n ** 2
  return quadrat_endrek(n - 1, sum)
end

def harm_rekursiv(n)
  if n < 1
    return nil
  end
  if n == 1
    return 1
  end
  return harm_rekursiv(n - 1) + 1.0 / n
end

def harm_endrek(n, sum = 1)
  if n < 1
    return nil
  end
  if n == 1
    return sum
  end
  neue_sum = sum + 1.0 / n
  return harm_endrek(n - 1, neue_sum)
end

def log2_rekursiv(n)
  if n < 1
    return nil
  end
  if n == 1
    return 1
  end
  return log2_rekursiv(n - 1) + (-1.0) ** (n + 1.0) / n
end


def log2_endrek(n, sum = 1)
  if n < 1
    return nil
  end
  if n == 1
    return sum
  end
  neue_sum = sum + (-1.0) ** (n + 1.0) / n
  return log2_endrek(n - 1, neue_sum)
end

puts quadrat_rekursiv(10)
puts quadrat_endrek(10)
puts
puts harm_rekursiv(10)
puts harm_endrek(10)
puts
puts log2_rekursiv(10000)
puts log2_endrek(10000)