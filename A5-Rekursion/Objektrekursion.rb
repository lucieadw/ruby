def gerade(ary, erg = [])
  ary.each {|elem|
    if elem.is_a?(Array)
      gerade(elem, erg)
    elsif elem.is_a?(Numeric)
      if elem % 2.0 == 0.0
        erg << elem
      end
    end
  }
  return erg
end

def tiefe(ary, count = -1)
  # speicher = []
  # ary.each {|elem|
  #   if elem.is_a?(Array)
  #     speicher << tiefe(elem, count + 1)
  #   else
  #     speicher << count
  #   end
  # }
  # return speicher.max()
  if !ary.is_a?(Array)
    return count
  elsif ary.empty?()
    return count + 1
  else
    return ary.map {|elem| tiefe(elem, count + 1)}.max()
  end
end

def sammeln(ary)


end
ary1 = [[1, 2], "hallo", 4, 0, 2454634, [[[6, [5]]]], 3001]
ary2 = [[[]],"beeb",8,[0]]
ary3 = [1,2,[3,[4]],[5,6,7]]
p gerade(ary1)
p tiefe(ary2)
