require './deck'
require 'test/unit'

class TestDeck < Test::Unit::TestCase

  def test_new
    d = Deck.new
    puts d.to_ints_str
    assert_equal(52, d.not_dealt.size)
    assert_equal(0,  d.dealt.size)
  end

  def test_deal_one
    d = Deck.new
    c = d.deal_one
    assert_equal(:clubs, c.suit)
    assert_equal(2, c.rank)
    # dealt
    assert_equal(c, d.dealt.first)
    assert_equal(1, d.dealt.size)
    # not_dealt
    top_c = d.not_dealt.first
    assert_equal(:clubs, top_c.suit)
    assert_equal(3,  top_c.rank)
    assert_equal(51, d.not_dealt.size)
  end

  def _test_to_s
    d = Deck.new
    d.show
  end

end
