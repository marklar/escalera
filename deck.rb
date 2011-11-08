
# The Deck class represents a standard 52-card deck, Ace high.
#
# There are two collections of cards, one for each state:
#   - dealt (D)
#   - not-yet-dealt (ND)
# Upon creation, all 52 cards are ND.
#
# Each collection is ordered:
#   - suits: alphabetical (clubs, diamonds, hearts, spades)
#   - values: 2 - A
#
# Methods:
#   - deal_one()
#       Moves the top card from ND to D.
#       Returns the card.
#   - print()
#       Prints ND and D (in order, as separate lists).
#   - shuffle(goodness)
#       Goodness: float, between 0.0 and 1.0.
#
# Shuffling:
#   - 0.0: perfectly random shuffle.
#   - 1.0: no suffling (unchanged).
# As 'goodness' increases, the quality of shuffle decreases.
#
# Make up your own shuffle algorithm.  Explain how it works.
# Imagine what a "real" shuffle (done by a person) might look like
# and try to capture some of the properties of that shuffle.
# (What is defined as a "perfect" shuffle above cannot be done by a
# person in a single shuffle, so you won't be able to exactly
# model a real shuffle.).

class Deck
  
end
