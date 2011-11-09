$LOAD_PATH << './lib'
require 'game'

# -- configs --
num_runs_per_config = 10_000
opts_num_players = 2..5
opts_num_cards = 5..7
opts_shuffle_goodness = (0..10).map {|i| i.to_f / 10.0 }

opts_num_players.each do |num_players|
  opts_num_cards.each do |num_cards|
    opts_shuffle_goodness.each do |goodness|
      puts "players: #{num_players}, cards: #{num_cards}, goodness: #{goodness}"
      num_straights = 0
      num_runs_per_config.times do
        g = Game.new(num_players, num_cards, goodness)
        num_straights += g.num_straights(3, false)
        # puts "num straights: #{g.num_straights(3, false)}"
        # puts g.hands
      end
      puts "  straights: #{num_straights} (#{num_straights.to_f / num_runs_per_config}%))"
      puts
    end
  end
end

