wuerfel = [[["stein000", "stein001"],
            ["stein010", "stein011"]],
           [["stein100", "stein101"],
            ["stein110", "stein111"]]]

x = 1

scheibe_hand = [[wuerfel[x][0][0]], [wuerfel[x][0][1]],
                [wuerfel[x][1][0]], [wuerfel[x][1][1]]]

p scheibe_hand

size = wuerfel[0].size

for y in 0...size
  for z in 0...size
    puts wuerfel[x][y][z]
  end
end

puts

for z in 0...size
  for y in 0...size
    puts wuerfel[x][y][z]
  end
end
