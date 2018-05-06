require "../dim_arrays/multi_dim_arrays"

srand(9999)
ary_2dim = random_initialize_2dim(6, 5, 45)
puts ary_2dim.to_s()
puts max_2dim(ary_2dim)


ary_3dim = random_initialize_3dim(6, 5, 4, 99)
puts ary_3dim.to_s()
puts max_3dim(ary_3dim)

puts matrix?(ary_2dim)
empty_2dim = Array.new() {Array.new()}
puts matrix?(empty_2dim)
mat = Array.new(3) {Array.new(4, -23)}
puts matrix?(mat)


wuerfel = Array.new(4) {|i| Array.new(4) {|j| Array.new(4) {|k| "led#{i}#{j}#{k}"}}}
puts wuerfel.to_s()

puts scheibe_vertikal_seite(wuerfel, 2).to_s()
puts scheibe_vertikal_vorne_y_x(wuerfel, 1).to_s()
puts scheibe_horizontal_z_x(wuerfel, 3).to_s()

#puts scheibe_horizontal_x_z(wuerfel, 3).to_s()
#puts scheibe_vertikal_vorne_x_y(wuerfel, 1).to_s()


puts quader?(wuerfel)
puts quader?(ary_3dim)
empty = Array.new() {Array.new() {Array.new()}}
puts quader?(empty)
quader = Array.new(4) {|i| Array.new(5) {|j| Array.new(2) {|k| rand(i + j + k)}}}
puts quader?(quader)
