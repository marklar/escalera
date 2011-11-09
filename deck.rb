require './card'
require './shuffle'

class Deck

  attr_accessor :not_dealt, :dealt
  
  def initialize
    @not_dealt = create_cards
    @dealt = []
  end

  #----------------------------

  # quality
  #   1.0: unchanged.
  #   0.0: perfectly random shuffling.
  def shuffle(quality)
    # Shuffle the not_dealt cards.
  end

  #----------------------------

  # Move top card (TC) from ND onto D.  Return TC.
  def deal_one
    top_card = not_dealt.shift
    dealt.unshift(top_card)
    top_card
  end

  def show
    puts self.to_s
  end

  # Prints ND and D (in order, as separate lists).
  def to_s
    "ND: " + not_dealt.inspect + "\n" + "D: " + dealt.inspect
  end

  #--------
  private

  def create_cards
    Card::Suits.map do |s|
      Card::Ranks.map {|r| Card.new(s,r) }
    end.flatten
  end
  
end
