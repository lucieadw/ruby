require 'test/unit'
require './gleichheit_und_hash/geodata_reader'

class GeodataTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @geo_database = GeodataReader.new("./gleichheit_und_hash/geo_database").geo_data_table()
    @geo_coords = @geo_database.keys()
    @hamburg = GeoCoord.new("Hamburg",Grad.new("N",53,33,3,906), Grad.new("E",9,59,37,255))
    @hamburg_pois = [POI.new("Alster"), POI.new("Rathaus"), POI.new("Jungfernstieg")]
    @seoul = GeoCoord.new("Seoul",Grad.new("N",37,33,59,526),Grad.new("E",126,58,40,688))
    @seoul_pois =  [POI.new("Hongdae"), POI.new("Buchon Hanbok"), POI.new("Regenbogenbrücke")]
    @moskau = GeoCoord.new("Moskau",Grad.new("N",55,45,20,974),Grad.new("E",37,37,2,28))
    @moskau_pois = [POI.new("Metro"), POI.new("Kolomenskoje"), POI.new("Puschkin Museum")]
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.
  def test_with_hash
    assert_equal(@hamburg_pois,@geo_database[@hamburg])
  end

  def test_with_array
    assert_equal([@hamburg,@seoul,@moskau].sort_by(){|geo| geo.region()}, @geo_database.keys().sort_by(){|geo| geo.region()})
  end

end