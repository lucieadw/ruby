require 'test/unit'
require_relative "../dim_arrays/multi_dim_arrays"

class ArrayTest < Test::Unit::TestCase

  def setup
    srand(9999)
    @ary_2dim_pos1 = random_initialize_2dim(6, 5, 45)
    @ary_2dim_grenze1 = random_initialize_2dim(6, 5, 0)
    @ary_2dim_grenze2 = Array.new() {Array.new()}
    @ary_2dim_grenze3 = Array.new(6) {Array.new(5, -45)}

    @ary_3dim_pos1 = random_initialize_3dim(6, 5, 4, 99)
    @ary_3dim_grenze1 = random_initialize_3dim(6, 5, 4, 0)
    @ary_3dim_grenze2 = Array.new() {Array.new() {Array.new()}}
    @ary_3dim_grenze3 = Array.new(6) {Array.new(5) {Array.new(4, -99)}}

    @matrix = Array.new(6) {Array.new(6, 45)}
    @quader = Array.new(4) {|i| Array.new(5) {|j| Array.new(2) {|k| rand(i + j + k)}}}
    @wuerfel = Array.new(5) {Array.new(5) {Array.new(5)}}
    @kein_quader = Array.new(rand(10)) {Array.new(rand (10)) {Array.new(rand(10))}}
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
    # Grenzfall 3
    max = max_2dim(@ary_2dim_grenze3)
    assert_equal(-45, max, "Max sollte -45 sein, aber war #{max}")
  end


  def test_positiv_max_3dim()
    # Positiv 1
    max = max_3dim(@ary_3dim_pos1)
    assert_equal(89, max, "Max sollte 89 sein, aber war #{max}")
  end

  def test_grenze_max_3dim()
    # Grenzfall 1
    max = max_3dim(@ary_3dim_grenze1)
    assert_equal(0, max, "Max sollte 0 sein, aber war #{max}")
    # Grenzfall 2
    max = max_3dim(@ary_3dim_grenze2)
    assert_equal(nil, max, "Max sollte 'nil' sein, aber war #{max}")
    # Grenzfall 3
    max = max_3dim(@ary_3dim_grenze3)
    assert_equal(-99, max, "Max sollte -99 sein, aber war #{max}")
  end

  def test_positiv_matrix?()
    # Positivfall 1
    is_matrix = matrix?(@matrix)
    assert_true(is_matrix,"Es sollte true zurückliefern")
  end

  def test_negativ_matrix?()
    # Negativfall 1
    is_matrix = matrix?(@ary_2dim_pos1)
    assert_false(is_matrix,"Es sollte false zurückliefern")
  end

  def test_grenze_matrix?()
    # Grenzfall 1
    is_matrix = matrix?(@ary_2dim_grenze2)
    assert_false(is_matrix,"Es sollte false zurückliefern")
  end

  def test_positiv_quader?()
    # Positivfall 1
    is_quader = quader?(@quader)
    assert_true(is_quader, "Es sollte true zurückliefern")
    # Positivfall 2
    is_quader = quader?(@wuerfel)
    assert_true(is_quader, "Es sollte true zurückliefern")
  end

  def test_negativ_quader?()
    # Negativfall 1
    is_quader = quader?(@kein_quader)
    assert_false(is_quader, "Es sollte false zurückliefern")
  end

  def test_grenze_quader?()
    # Grenzfall 1
    is_quader = quader?(@ary_3dim_grenze2)
    assert_false(is_quader, "Es sollte false zurückliefern")
  end

end