require 'array_util'

class Array
  R = Random.new

  # Does NOT mutate ary.
  def piles_shuffle(goodness=0.0)
    # Create empty piles.
    n_piles = num_shuffle_piles(goodness)
    piles = (0...n_piles).map { [] }
    # Deal elements from ary into piles, in random order each cycle.
    ary = self.dup
    while (! ary.empty?)
      piles = piles.sort_shuffle
      piles.each do |p|
        p << ary.shift unless ary.empty?
      end
    end
    # Join piles in random order?
    # piles.sort_shuffle.flatten
    piles.flatten
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
      map {|e| [R.rand(0..BIG_NUM), e] }.  # Assign random num to each.
      sort {|a,b| a[0] <=> b[0] }.         # Sort by random num.
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
      j = R.rand(0..i)
      self.swap_at_indices(i, j)
    end
    self
  end

  def riffle_shuffle
    # Split the deck in 1/2.  Top into left hand; bottom into right.
    # Interleave the cards.  First one from left, then one from right.
  end

end
