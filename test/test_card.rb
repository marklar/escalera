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

end
