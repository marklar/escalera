require 'array_shuffle'
require 'test/unit'

class TestArrayShuffle < Test::Unit::TestCase

  def setup
    @a = [0,1,2,3,4,5,6,7,8,9]
  end

  def test_num_shuffle_piles
    nums = (0..51).to_a
    assert_equal(52, nums.num_shuffle_piles(0.0))
    assert_equal(47, nums.num_shuffle_piles(0.1))
    assert_equal(42, nums.num_shuffle_piles(0.2))
    assert_equal(37, nums.num_shuffle_piles(0.3))
    assert_equal(32, nums.num_shuffle_piles(0.4))
    assert_equal(27, nums.num_shuffle_piles(0.5))
    assert_equal(22, nums.num_shuffle_piles(0.6))
    assert_equal(17, nums.num_shuffle_piles(0.7))
    assert_equal(12, nums.num_shuffle_piles(0.8))
    assert_equal(7,  nums.num_shuffle_piles(0.9))
    assert_equal(1,  nums.num_shuffle_piles(1.0))
  end

  def test_piles
    a_dup = @a.dup
    a = @a.piles_shuffle(1.0)
    assert( a_dup.same_elements?(@a.dup) )
    # puts "@a: #{@a.inspect}"
    # puts "A: #{a.inspect}"
    b = @a.piles_shuffle(1.0)
    # puts "B: #{b.inspect}"
    assert( a.same_elements?(b) )

    c = @a.piles_shuffle(0.5)
    assert_equal(@a.size, c.size)
    # puts "C: #{c.inspect}"

    d = @a.piles_shuffle(0.9)
    # puts "D: #{d.inspect}"
  end

  def test_mongean
    a = @a.mongean_shuffle
    assert_equal(10, a.size)
    # puts "Mongean: " + a.inspect
  end

  def test_knuth
    a = @a.dup
    @a.knuth_shuffle!
    assert( ! a.same_elements?(@a) )
    assert_equal(10, @a.size)
    # puts "Knuth: " + a.inspect
  end

  def test_sorting
    a = @a.sort_shuffle
    assert_equal(10, a.size)
    # puts "Sort: " + a.inspect
  end

  def test_sorting_with_array_of_arrays
    a = [ [0,1], [2,3], [4,5], [6,7] ]
    a = a.sort_shuffle.sort_shuffle.sort_shuffle.sort_shuffle
    # puts a.inspect
  end

end
