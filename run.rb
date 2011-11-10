$LOAD_PATH << './lib'
require 'game'

# -- configs --
num_divisions = 100
num_runs_per_config = 1_000
opts_num_players = [2] # 2..5
opts_num_cards   = [5] # 5..7
opts_shuffle_goodness = (0..num_divisions).map {|i| i.to_f / num_divisions }

opts_num_players.each do |num_players|
  opts_num_cards.each do |num_cards|
    opts_shuffle_goodness.each do |goodness|
      num_straights = 0
      num_runs_per_config.times do
        g = Game.new(num_players, num_cards, goodness)
        num_straights += g.num_straights(3, false)
        # puts "num straights: #{g.num_straights(3, false)}"
        # puts g.hands
      end
      perc = num_straights.to_f / (num_players * num_runs_per_config)
      # puts "players: #{num_players}, cards: #{num_cards}, goodness: #{goodness}" +
      #   "  straights: #{num_straights} (#{perc}%)"
      puts "#{goodness}: #{perc}%"
    end
  end
end

