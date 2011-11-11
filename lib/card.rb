
# Represents a single playing card.
class Card
  Suits = [:clubs, :diamonds, :hearts, :spades]
  Ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :j, :q, :k, :a]

  attr_accessor :suit, :rank

  def initialize(suit, rank)
    validate(suit, rank)
    (@suit, @rank) = [suit, rank]
  end

  # any suit
  def straight_before?(other)
    Ranks.find_index(other.rank) == Ranks.find_index(rank).succ
  end

  # same suit
  def flush_before?(other)
    (suit == other.suit) && straight_before?(other)
  end

  def cmp_suit_then_rank(other)
    c = cmp_suit(other)
    c == 0 ? cmp_rank(other) : c
  end

  def cmp_rank_then_suit(other)
    c = cmp_rank(other)
    c == 0 ? cmp_suit(other) : c
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
    rank.to_s + '/' + 
      case RUBY_VERSION
      when /^1\.9\./
        suit.to_s[0]
      else
        suit.to_s[0].chr
      end
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

  def cmp_suit(other)
    Suits.find_index(self.suit) <=> Suits.find_index(other.suit)
  end

  def cmp_rank(other)
    Ranks.find_index(self.rank) <=> Ranks.find_index(other.rank)
  end

end
