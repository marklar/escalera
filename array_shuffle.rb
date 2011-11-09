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
require './array_util'

$r = Random.new

class Array

  # Deal elems into a number of piles, in random order each cycle.
  # (Could also use random_idx(ary), which would mean not using cycles.)
  # Then stack piles in random order.
  # Does NOT mutate ary.
  def piles_shuffle(goodness=0.0)
    ary = self.dup
    n_piles = num_shuffle_piles(goodness)
    piles = (0...n_piles).map {|_| [] }
    while (! ary.empty?)
      piles = piles.sort_shuffle
      piles.each do |p|
        p << ary.shift unless ary.empty?
      end
    end
    # Join piles in random order.
    piles.sort_shuffle.flatten
  end

  # 1..count
  def num_shuffle_piles(goodness)
    (self.size - (goodness * (self.size-1))).ceil
  end

  # Does NOT mutate ary.
  # O(n log n).  Not in constant space, either.
  BIG_NUM = 100_000
  def sort_shuffle
    self.
      map {|e| [$r.rand(0..BIG_NUM), e] }.  # Assign random num to each.
      sort.                                 # Sort by random num.
      map {|(_,c)| c }
  end

  # completely un-random.
  # 1 to bottom, 2 to top, 3 to bottom, etc.
  # Does NOT mututate ary.
  def mongean_shuffle
    unshuf = self.dup
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

  # http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
  # aka Fisher-Yates.  Linear-time algo.
  # MUTATES ary.
  def knuth_shuffle!
    (self.size - 1).downto(1) do |i|
      j = $r.rand(0..i)
      self.swap_at_indices(i, j)
    end
    self
  end

  def riffle_shuffle
    # Split the deck in 1/2.  Top into left hand; bottom into right.
    # Interleave the cards.  First one from left, then one from right.
  end

end
