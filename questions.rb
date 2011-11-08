#
# Answer the following questions by simulation (not by calculation).
# Generate many random deals.
# Collect statistics from those deals (using the classes defined above).
#
# Starting point:
#   - 2 players
#   - perfect shuffle (0.0)
#   - alternating deal: player1, player2, player1, etc.
#   - 5 cards each
#
# - What are the chances of being dealt a 3-card straight, i.e.  three
  consecutive cards.  The three cards may be of different suits, and
  it still counts as a 3-card straight if there are more than three
  consecutive cards. This hand has a 3-card straight:
     4 of clubs, 5 of spades, 6 of diamonds 7 of clubs, K of clubs
  This hand does not:
     4 of clubs, 5 of clubs,  7 of clubs, 8 of spades, K of clubs

- How do the chances vary with how well the deck is shuffled?
  (i.e. with the "goodness" parameter in the Deck shuffle method).

- How does this answer change if you vary the number of players?
