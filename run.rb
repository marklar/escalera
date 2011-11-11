#!/usr/bin/env ruby
$LOAD_PATH << './lib'
require 'game'

def percent_straights(num_players, num_cards, goodness, num_runs)
  num_straights = 0
  num_runs.times do
    g = Game.new(num_players, num_cards, goodness)
    num_straights += g.num_straights(3, false)
  end
  100.0 * num_straights / (num_players * num_runs)
end

def goodness_values(n)
  (0..n).map {|i| i.to_f / n }
end

def p(goodness, perc)
  printf "       %.2f : %.2f \%\n", goodness, perc
end

def question_one
  str = ["Q: Given these conditions:",
         "    - perfect shuffle",
         "    - 2 players",
         "    - 5 cards each, alternating",
         "  What are the chances of being dealt a 3-card straight?"]
  puts
  puts str.join "\n"
  perc = percent_straights(2, 5, 0.0, 10_000)
  printf "A: Probability: %.2f\n", (perc / 100.0)
  puts
end

def question_two(num_vals=20)
  puts "Q: How do the chances vary with how well the deck is shuffled?"
  puts "A: goodness : straights"
  goodness_values(num_vals).each do |goodness|
    perc = percent_straights(2, 5, goodness, 1_000)
    p(goodness, perc)
  end
  puts
end

def question_three(num_vals=20, players=(3..6))
  puts "Q: How does this answer change if you vary the number of players?"
  (3..6).each do |num_players|
    puts "A: #{num_players} players"
    puts "    goodness : straights"
    goodness_values(num_vals).each do |goodness|
      perc = percent_straights(num_players, 5, goodness, 1_000)
      p(goodness, perc)
    end
    puts
  end
end

# --- main ---
question_one
question_two(20)
question_three(20, 3..6)

