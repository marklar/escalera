$LOAD_PATH << './lib'
require 'card'
require 'test/unit'

class TestCard < Test::Unit::TestCase

  def test_eq
    c1 = Card.new(:spades, 3)
    c2 = Card.new(:spades, 3)
    assert( c1 == c2 )
  end

  def test_new
    assert_raise(ArgumentError) { Card.new(:hearts, 1) }  # 1
    assert_raise(ArgumentError) { Card.new(:heart,  2) }  # :heart
    assert_nothing_raised(ArgumentError) { Card.new(:hearts, 2) }
  end

  def test_to_i
    assert_equal(0,  Card.new(:clubs,   2).to_i)
    assert_equal(51, Card.new(:spades, :a).to_i)
  end

  def test_cmp_suit
    c1 = Card.new(:diamonds, 3)
    c2 = Card.new(:diamonds, 8)
    c3 = Card.new(:hearts, 3)
    assert_equal(0,  c1.send(:cmp_suit, c2))
    assert_equal(-1, c1.send(:cmp_suit, c3))
    assert_equal(1,  c3.send(:cmp_suit, c1))
  end

  def test_cmp_rank
    c1 = Card.new(:diamonds, 3)
    c2 = Card.new(:diamonds, 8)
    c3 = Card.new(:hearts, 3)
    assert_equal(-1, c1.send(:cmp_rank, c2))
    assert_equal(0,  c1.send(:cmp_rank, c3))
    assert_equal(1,  c2.send(:cmp_rank, c1))
  end

  def test_cmp_rank_then_suit
    c1 = Card.new(:diamonds, 3)
    c2 = Card.new(:diamonds, 8)
    c3 = Card.new(:hearts, 3)
    assert_equal(-1, c1.cmp_rank_then_suit(c2))
    assert_equal(-1, c1.cmp_rank_then_suit(c3))
    assert_equal(1,  c2.cmp_rank_then_suit(c1))
  end

  def test_cmp_suit_then_rank
    c1 = Card.new(:diamonds, 3)
    c2 = Card.new(:diamonds, 8)
    c3 = Card.new(:hearts, 3)
    assert_equal(-1, c1.cmp_suit_then_rank(c2))
    assert_equal(-1, c1.cmp_suit_then_rank(c3))
    assert_equal(1,  c2.cmp_suit_then_rank(c1))
  end

end
