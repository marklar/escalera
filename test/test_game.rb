$LOAD_PATH << './lib'
require 'game'
require 'test/unit'

class TestGame < Test::Unit::TestCase

  def test_new
    g = Game.new(2, 5, 0.5)
    assert_equal(2, g.hands.size)
    assert_equal(5, g.hands[0].size)
    assert_equal(5, g.hands[1].size)
    # their sets of cards should be distinct
    assert_equal(42, g.deck.not_dealt.size)
    assert_equal(10, g.deck.dealt.size)
  end

  def test_num_straights
    # HOW TO TEST THIS?
  end

end
