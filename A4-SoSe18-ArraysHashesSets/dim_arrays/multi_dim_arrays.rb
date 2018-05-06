def random_initialize_2dim(max_rows, max_row_length, max_value)
  if max_value < 0
    puts "Max_value muss eine positive Zahl sein"
  else
    ary_2dim = Array.new(rand(max_rows + 1)) {Array.new(rand(max_row_length + 1)) {rand(max_value + 1)}}
    return ary_2dim
  end
end

def max_2dim(ary_2dim)
  if ary_2dim.empty?
    return nil
  end
  maxi = nil
  ary_2dim.each {|ary|
    new_max = ary.max
    if maxi == nil
      maxi = new_max
    elsif new_max != nil && new_max > maxi
      maxi = new_max
    end
  }
  maxi
end

def random_initialize_3dim(max_width, max_height, max_depth, max_value)
  if max_value < 0
    puts "Max_value muss eine positive Zahl sein."
  else
    ary_3dim = Array.new(rand(max_width + 1)) {Array.new(rand(max_height + 1)) {Array.new(rand(max_depth + 1)) {rand(max_value + 1)}}}
    return ary_3dim
  end
end

def max_3dim(ary_3dim)
  if ary_3dim.empty?
    return nil
  end
  maxi = nil
  ary_3dim.each {|ary|
    ary.each {|ary2|
      new_max = ary2.max
      if maxi == nil
        maxi = new_max
      elsif new_max != nil && new_max > maxi
        maxi = new_max
      end
    }
  }
  maxi
end

def matrix?(ary_2dim)
  if ary_2dim.empty?
    return false
  end
  l = ary_2dim[0].length
  ary_2dim.each {|elem|
    if l != elem.length
      return false
    end
  }
  return true
end


def quader?(ary_3dim)
  if !matrix?(ary_3dim)
    return false
  elsif ary_3dim[0].empty?
    return false
  end
  l = ary_3dim[0][0].length
  ary_3dim.each {|elem|
    elem.each {|elem2|
      if l != elem2.length
        return false
      end
    }
  }
  return true
end


def scheibe_vertikal_seite(wuerfel, x)
  vert_seite = Array.new()
  wuerfel[x].each {|yz|
    vert_seite << yz
  }
  return vert_seite
end


def scheibe_vertikal_vorne_y_x(wuerfel, z)
  vorne = Array.new()
  wuerfel.each {|xyz|
    y_ary = Array.new()
    xyz.each {|yz|
      y_ary << yz[z]
    }
    vorne << y_ary
  }
  return vorne
end

# was will das machen
# def scheibe_vertikal_vorne_x_y(wuerfel, z)
# end


def scheibe_horizontal_z_x(wuerfel, y)
  hor_seite = Array.new()
  wuerfel.each {|xyz|
    z_ary = Array.new()
    xyz[y].each {|yz|
      z_ary << yz}
    hor_seite << z_ary
  }
  return hor_seite
end

# was
# def scheibe_horizontal_x_z(wuerfel, y)
# end