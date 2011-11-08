
# Hand:
# Represents a set of cards. From 0 to 52 (51?), total.
# Cards are always in a definite order.
#
# Methods:
#   - print()       -- prints the hand (in order)
#   - addCard(card) -- adds a card to the hand
#   - sortBySuit()  -- sorts the cards by suit, and then by value
#   - sortByValue() -- sorts by value, then by suit
#   - hasStraight(len, sameSuit)
#       Returns true if hand contains a straight of the given length.
#       If sameSuit is true, counts only flushes (same-suit straights).
#       If sameSuit is false, count all straights.
#       See below after "What are the changes of being
                dealt a 3-card straight" for a definition of
                "straight")
