def deep_find_all(ary, &block)
  ary.inject([]) {|acc, elem|
    if elem.is_a?(Array)
      acc.concat(deep_find_all(elem, &block))
    elsif elem.is_a?(Numeric)
      if block.call(elem)
        acc << elem
      end
    end
    # acc muss immer zurück gegeben werden, egal was in dem Array steht
    acc
  }
end

def depth(ary, count = -1)
  if !ary.is_a?(Array)
    return count
  elsif ary.empty?()
    return count + 1
  else
    return ary.map {|elem| depth(elem, count + 1)}.max()
  end
end

def deep_copy(ary)
  if depth(ary) == 0
    return ary
  else
    return ary.find_all {|elem| elem.is_a?(Array)}
               .inject([]) {|acc, elem| acc.concat(deep_copy(elem))}
  end
end


def deep_to_a(hash)
  hash.inject([]) {|acc, paar|
    key = paar[0]
    val = paar[1]
    if key.is_a?(Hash) && val.is_a?(Hash)
      acc << [deep_to_a(key), deep_to_a(val)]
    elsif key.is_a?(Hash)
      acc << [deep_to_a(key), val]
    elsif val.is_a?(Hash)
      acc << [key, deep_to_a(val)]
    else
      acc << [key, val]
    end
  }
end

ary1 = [[1, 2], "hallo", 4, 0, 2454634, [[[6, [5]]]], 3001]
ary2 = [[[]], "beeb", 8, [0]]
ary3 = [1, 2, [3, [4], 5], 6, [7]]
hash = {2 => 7, 1 => {2 => {3 => {4 => {7 => 9}, 5 => {8 => {10 => {11 => {12 => 13}}}}}}},
        3 => {{2 => {17 => {15 => {21 => 9}, 23 => {8 => {10 => {1 => {2 => 3}}}}}}} => {1 => 8}}}

p deep_find_all(ary1) {|elem| elem % 2.0 == 0.0}
p depth(ary2)
p deep_copy(ary3)
p deep_to_a(hash)