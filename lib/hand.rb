
# Hand:
# Represents a set of cards, cardinality from 0 to 52 cards.
# Cards are always in some definite order.
#
# Methods:
#   - hasStraight(len, sameSuit)
#       Returns true if hand contains a straight of the given length.
#       If sameSuit is true, counts only flushes (same-suit straights).
#       If sameSuit is false, count all straights.
#
require 'card'

class Hand
  attr_accessor :cards

  def initialize(cards=[])
    @cards = cards
  end

  def has_straight?(len, in_same_suit)
    if in_same_suit
      sort_by_suit!
      # take each window of len cards, see if straight
    else
      sort_by_rank!
    end
  end

  def <<(card)
    @cards << card
  end
  alias :add_card :'<<'

  # first by suit, then by value
  def sort_by_suit!
    @cards.sort! {|a,b| a.cmp_suit_then_rank(b) }
  end

  # first by rank, then by suit
  def sort_by_rank!
    @cards.sort! {|a,b| a.cmp_rank_then_suit(b) }
  end
  alias :sort_by_value! :sort_by_rank!
    
  def to_s
    @cards.inspect
  end

end
