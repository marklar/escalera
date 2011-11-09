
# Represents a single playing card.
class Card
  attr_accessor :suit, :rank

  Suits = [:clubs, :diamonds, :hearts, :spades]
  Ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :j, :q, :k, :a]

  def initialize(suit, rank)
    validate(suit, rank)
    (@suit, @rank) = [suit, rank]
  end

  # Value (not obj) identity.
  def ==(other)
    (suit == other.suit) && (rank == other.rank)
  end

  def to_s
    rank.to_s + '/' + suit.to_s[0]
  end

  def validate(suit, rank)
    unless Suits.include? suit
      raise ArgumentError.new("Unknown card suit: #{suit}")
    end
    unless Ranks.include? rank
      raise ArgumentError.new("Unknown card rank: #{rank}")
    end
  end

end
