#
# Answer the following questions by simulation (not by calculation).
#   Generate many random deals.
#   Collect stats from those deals.
#
# Starting point:
#   - 2 players
#   - perfect shuffle (0.0)
#   - alternating deal: player1, player2, player1, etc.
#   - 5 cards each
#
# Questions:
# 
# 1. What are the chances of being dealt a 3-card straight, i.e. three
# consecutive cards?
#
# The 3 cards may be of different suits, and there may be more
# than 3 consecutive cards.
#
# This hand has a 3-card straight:
#   - 4 clubs, 5 spades, 6 diamonds, 7 clubs, K clubs
# This hand does not:
#   - 4 clubs, 5 clubs, 7 clubs, 8 spades, K clubs
#
# 2. How do the chances vary with how well the deck is shuffled,
# i.e. with the "goodness" parameter in the Deck shuffle method?
#
# 3. How does this answer change if you vary the number of players?
#
