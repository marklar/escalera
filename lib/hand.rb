require 'card'

class Hand
  attr_accessor :cards

  def initialize(cards=[])
    @cards = cards
  end

  def has_straight?(len, in_same_suit)
    if in_same_suit then has_flush?(len) else has_simple_straight?(len) end
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

  def size
    @cards.size
  end

  #--------
  private

  def has_simple_straight?(len)
    sort_by_rank!
    @cards.windows(len).any? do |cs|
      cs.windows(2).all? {|(a,b)| a.straight_before?(b) }
    end
  end

  def has_flush?(len)
    sort_by_suit!
    @cards.windows(len).any? do |cs|
      cs.windows(2).all? {|(a,b)| a.flush_before?(b) }
    end
  end

end
