require './util'
require 'test/unit'

class TestUtil < Test::Unit::TestCase
  
  def test_random_idx
    ary = [0,1,2,3]
    100.times do |_|
      assert( ary.include? random_idx(ary) )
    end
  end

  def test_same_elements
    a = [1,2,3]
    b = [1,2,3]
    assert( same_elements?(a,b) )
    assert( same_elements?(b,a) )
    c = [1,2,3,4]
    assert( ! same_elements?(a,c) )
    assert( ! same_elements?(c,a) )
  end

  def test_all_uniq
    assert( all_uniq?([0,1,2,3]) )
    assert_equal(false, all_uniq?([0,0,1,0]) )
  end

  def test_swap_nothing
    ary = [0,1,2,3]
    swap(ary, 0, 0)
    # [0,1,2,3]
    assert_equal(0, ary[0])
    assert_equal(1, ary[1])
    assert_equal(2, ary[2])
    assert_equal(3, ary[3])
  end

  def test_swap
    ary = [0,1,2,3]
    swap(ary, 0, 2)
    # [2,1,0,3]
    assert_equal(2, ary[0])
    assert_equal(1, ary[1])
    assert_equal(0, ary[2])
    assert_equal(3, ary[3])
    swap(ary, 1, 2)
    # [2,0,1,3]
    assert_equal(2, ary[0])
    assert_equal(0, ary[1])
    assert_equal(1, ary[2])
    assert_equal(3, ary[3])
  end

end
