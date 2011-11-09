require './shuffle'
require './util'
require 'test/unit'

class TestShuffle < Test::Unit::TestCase

  def setup
    @a = [0,1,2,3,4,5,6,7,8,9]
  end

  def test_num_piles
    s = Shuffle
    n = 52
    assert_equal(52, s.num_piles(n, 0.0))
    assert_equal(47, s.num_piles(n, 0.1))
    assert_equal(42, s.num_piles(n, 0.2))
    assert_equal(37, s.num_piles(n, 0.3))
    assert_equal(32, s.num_piles(n, 0.4))
    assert_equal(27, s.num_piles(n, 0.5))
    assert_equal(22, s.num_piles(n, 0.6))
    assert_equal(17, s.num_piles(n, 0.7))
    assert_equal(12, s.num_piles(n, 0.8))
    assert_equal(7,  s.num_piles(n, 0.9))
    assert_equal(1,  s.num_piles(n, 1.0))
  end

  def test_piles
    a = Shuffle.piles(@a, 1.0)
    b = Shuffle.piles(@a, 1.0)
    assert( same_elements?(a,b) )
  end

  def test_mongean
    a = Shuffle.mongean(@a)
    assert_equal(10, a.size)
    puts "Mongean: " + a.inspect
  end

  def test_knuth
    a = @a.dup
    Shuffle.knuth!(@a)
    assert( ! same_elements?(a, @a) )
    assert_equal(10, @a.size)
    puts "Knuth: " + a.inspect
  end

  def test_sorting
    a = Shuffle.sorting(@a)
    assert_equal(10, a.size)
    puts "Sort: " + a.inspect
  end

end
