$LOAD_PATH << './lib'
require 'hand'
require 'test/unit'

class TestHand < Test::Unit::TestCase

  def setup
    @h = Hand.new [ Card.new(:hearts,   :j),
                    Card.new(:hearts,    8),
                    Card.new(:spades,    7),
                    Card.new(:diamonds, :k),
                    Card.new(:clubs,     9)
                  ]
  end

  def test_has_straight
    # @h
  end

  def test_to_s
    assert_equal('[j/h, 8/h, 7/s, k/d, 9/c]', @h.to_s)
  end

  def test_new
    cards = [Card.new(:hearts,2)]
    h = Hand.new(cards)
    assert_equal('[2/h]', h.to_s)
  end

  def test_add
    h = Hand.new
    h << Card.new(:hearts,2)
    assert_equal('[2/h]', h.to_s)
  end

  def test_sort_by_suit
    @h.sort_by_suit!
    assert_equal('[9/c, k/d, 8/h, j/h, 7/s]', @h.to_s)
  end

  def test_sort_by_rank
    @h.sort_by_rank!
    assert_equal('[7/s, 8/h, 9/c, j/h, k/d]', @h.to_s)
  end

end

