def binary_search(sam, elem, links = 0, rechts = (sam.size - 1))
  mitte = (rechts - links) / 2 + links
  if sam == []
    return -1
  end
  case elem <=> sam[mitte]
    when 0
      return mitte
    when -1
      if rechts == mitte
        if elem == sam[links]
          return links
        else
          return -1
        end
      else
        return binary_search(sam, elem, links, mitte)
      end
    when 1
      if links == mitte
        if elem == sam[rechts]
          return rechts
        else
          return -1
        end
      else
        return binary_search(sam, elem, mitte, rechts)
      end
    when nil
      return -1
  end
end

sam = [1, 2, 4, 8, 16, 32, 64, 128, 256, 333, 512]
elem = 333
sam1 = %w(Alpaka Dodo Fuchs Hirsch Lurch Roter\ Panda Schmetterling Yak)
elem1 = "Roter Panda"

p binary_search(sam, elem)
puts
p binary_search(sam1, elem1)