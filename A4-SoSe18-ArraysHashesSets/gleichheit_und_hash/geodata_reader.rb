require_relative "./geo_coord"
require_relative "./poi"

class GeodataReader

  def initialize(file)
    @file = file
    @geo_data_table = create_geo_data_table()
  end

  def geo_data_table()
    return @geo_data_table
  end

  def create_geo_data_table()
    data_table = {}
    File.open(@file, "r:UTF-8") {|file|
      file.each() {|line|
        data = line.split("#")
        data_geo = data.shift().split()

        region = data_geo.shift()
        grad1 = data_geo.slice!(0..3)
        grad1_sec = grad1[2].chop().split(".")
        grad2 = data_geo.slice!(0..3)
        grad2_sec = grad2[2].chop().split(".")
        breite = Grad.new(grad1[3], grad1[0].chop().to_i(), grad1[1].chop().to_i(), grad1_sec[0].to_i(), grad1_sec[1].to_i())
        laenge = Grad.new(grad2[3], grad2[0].chop().to_i(), grad2[1].chop().to_i(), grad2_sec[0].to_i(), grad2_sec[1].to_i())
        pois = data.map() {|name| name.strip!(); POI.new(name)}
        data_table[GeoCoord.new(region, breite, laenge)] = pois
      }
    }
    return data_table
  end

  private :create_geo_data_table

  def to_s()
    "#{@geo_data_table.map() {|key, val| "#{key} => #{val.join(",")}"}.join("\n")}"
  end
  #
  # def [](geo_coord)
  #   return @geo_data_table[geo_coord]
  # end
end

#gr = GeodataReader.new("geo_database")
#puts gr
