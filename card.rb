
# Represents a single playing card.
class Card
  Suits = [:clubs, :diamonds, :hearts, :spades]
  Ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :j, :q, :k, :a]

  attr_accessor :suit, :rank

  def initialize(suit, rank)
    validate(suit, rank)
    (@suit, @rank) = [suit, rank]
  end

  # Value (not obj) identity.
  def ==(other)
    (suit == other.suit) && (rank == other.rank)
  end

  # 0..51.  To facilitate seeing effects of shufflings.
  def to_i
    (Suits.find_index(suit) * Ranks.size) + Ranks.find_index(rank)
  end

  def to_s
    rank.to_s + '/' + suit.to_s[0]
  end

  #--------
  private

  def validate(suit, rank)
    unless Suits.include? suit
      raise ArgumentError.new("Unknown card suit: #{suit}")
    end
    unless Ranks.include? rank
      raise ArgumentError.new("Unknown card rank: #{rank}")
    end
  end

end
