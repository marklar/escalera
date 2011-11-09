$LOAD_PATH << './lib'
require 'deck'
require 'hand'

# Create game
#
# Creates and shuffles a deck.
# Deals two or more 5-card hands from the deck.
# Can generate many deals and collect statistics on them, in order
# to answer the questions below.

class Game
  attr_accessor :deck, :hands

  def initialize(num_players, num_cards, shuffle_goodness)
    @deck = Deck.new.shuffle!(shuffle_goodness)
    @hands = create_hands(num_players, num_cards)
  end

  def num_straights(len, in_same_suit)
    hands.inject(0) do |sum, h|
      h.has_straight?(len, in_same_suit) ? sum+1 : sum
    end
  end

  #--------
  private

  def create_hands(num_players, num_cards)
    hands = (0...num_players).map { Hand.new }
    (0...num_cards).each do
      # deal alternately to each hand
      hands.each {|h| h << deck.deal_one }
    end
    hands
  end

end


if __FILE__ == $0
  g = Game.new(2, 5, 0.5)
  puts g.hands
  puts "num straights: #{g.num_straights(3, false)}"
  puts g.hands
end
