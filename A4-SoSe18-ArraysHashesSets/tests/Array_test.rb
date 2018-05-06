require 'test/unit'
require_relative "../dim_arrays/multi_dim_arrays"

class ArrayTest < Test::Unit::TestCase

  def setup
    srand(9999)
    @ary_2dim_pos1 = random_initialize_2dim(6, 5, 45)
    @ary_2dim_grenze1 = random_initialize_2dim(6, 5, 0)
    @ary_2dim_grenze2 = Array.new()
  end

  def test_positiv_max_2dim()
    # positiv 1
    max = max_2dim(@ary_2dim_pos1)
    assert_equal(45, max, "Max sollte 45 sein, aber war #{max}")
  end

  def test_grenze_max_2dim()
    # Grenzfall 1
    max = max_2dim(@ary_2dim_grenze1)
    assert_equal(0, max, "Max sollte 0 sein, aber war #{max}")
    # Grenzfall 2
    max = max_2dim(@ary_2dim_grenze2)
    assert_equal(nil, max, "Max sollte 'nil' sein, aber war #{max}")
  end

  def teardown
    # Do nothing
  end

end