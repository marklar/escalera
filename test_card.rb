require './card'
require 'test/unit'

class TestCard < Test::Unit::TestCase

  def test_eq
    c1 = Card.new(:spades, 3)
    c2 = Card.new(:spades, 3)
    assert( c1 == c2 )
  end

  def test_new
    assert_raise(ArgumentError) { Card.new(:hearts, 1) }
    assert_raise(ArgumentError) { Card.new(:heart, 2) }
  end

end
