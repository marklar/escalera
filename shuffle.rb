#
# Shuffling:
#   - 0.0: perfectly random shuffle.
#   - 1.0: no shuffling (unchanged).
# As 'goodness' increases, the quality of shuffle decreases.
#
# Make up your own shuffle algorithm.  Explain how it works.
# Imagine what a "real" shuffle (done by a person) might look like
# and try to capture some of the properties of that shuffle.
#
# (What is defined as a "perfect" shuffle above cannot be done by a
# person in a single shuffle, so you won't be able to exactly
# model a real shuffle.).
#
require './util'

module Shuffle

  # Does NOT mutate ary.
  def self.piles(ary, goodness=0.0)
    # Cards are simply dealt out into a number of piles.
    # Piles are stacked on top of each other.
    # Ensures separation.  Bad randomization.
    # Improve random by dealing to piles in different orders w/ each circuit.
    n_piles = num_piles(ary.size, goodness)
    # Create (spots for) multiple piles.
    piles = (0...n_piles).map {|_| [] }
    # Deal one card to each pile in random order.
    # (Either one per pile in each cycle, or in cycle-free fashion.)
    
    # Conjoin piles in random order.
    ary
  end

  # 1..count
  def self.num_piles(count, goodness)
    (count - (goodness * (count-1))).ceil
  end

  # http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
  # aka Fisher-Yates.  Linear-time algo.
  # MUTATES ary.
  def self.knuth!(ary)
    (ary.size - 1).downto(1) do |i|
      j = $r.rand(0..i)
      swap(ary, i, j)
    end
    ary
  end

  # Does NOT mutate ary.
  # O(n log n).  Not in constant space, either.
  BIG_NUM = 100_000
  def self.sorting(ary)
    ary.
      map {|e| [$r.rand(0..BIG_NUM), e] }.  # Assign random num to each.
      sort.                                 # Sort by random num.
      map {|(_,c)| c }
  end

  # completely un-random.
  # 1 to bottom, 2 to top, 3 to bottom, etc.
  # Does NOT mututate ary.
  def self.mongean(ary)
    unshuf = ary.dup
    shuf = []
    where = :bottom
    while (not unshuf.empty?)
      c = unshuf.shift
      if where == :top
        shuf.unshift(c)
        where = :bottom
      else
        shuf.push(c)
        where = :top
      end
    end
    shuf
  end

  def self.riffle(ary)
    # Split the deck in 1/2.  Top into left hand; bottom into right.
    # Interleave the cards.  First one from left, then one from right.
  end

  # aka: overhand, stripping, hindu
  def self.slide(ary)
    # small groups of cards are removed from the top of a deck
    # and assembled in reverse order
  end

end
