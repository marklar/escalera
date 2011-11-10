require 'array_util'

class Array
  #
  # What can be impacted by the goodness score?
  #   - number of piles
  #   - number of cards to move at a time
  #   - 

  # Does NOT mutate ary.
  def pile_shuffle(goodness=0.0)
    # Create empty piles.
    n_piles = num_piles(goodness)
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
  def num_piles(goodness)
    (self.size - (goodness * (self.size-1))).ceil
  end

end
