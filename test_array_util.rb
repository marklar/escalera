require './array_util'
require 'test/unit'

class TestUtil < Test::Unit::TestCase
  
  def test_same_elements
    a = [1,2,3]
    b = [1,2,3]
    assert( a.same_elements?(b) )
    assert( b.same_elements?(a) )
    c = [1,2,3,4]
    assert( ! a.same_elements?(c) )
    assert( ! c.same_elements?(a) )
  end

  def test_all_uniq
    assert( [0,1,2,3].all_uniq? )
    assert_equal(false, [0,0,1,0].all_uniq? )
  end

  def test_swap_nothing
    ary = [0,1,2,3]
    ary.swap_at_indices(0, 0)
    # [0,1,2,3]
    assert_equal(0, ary[0])
    assert_equal(1, ary[1])
    assert_equal(2, ary[2])
    assert_equal(3, ary[3])
  end

  def test_swap
    ary = [0,1,2,3]
    ary.swap_at_indices(0, 2)
    # [2,1,0,3]
    assert_equal(2, ary[0])
    assert_equal(1, ary[1])
    assert_equal(0, ary[2])
    assert_equal(3, ary[3])
    ary.swap_at_indices(1, 2)
    # [2,0,1,3]
    assert_equal(2, ary[0])
    assert_equal(0, ary[1])
    assert_equal(1, ary[2])
    assert_equal(3, ary[3])
  end

end
