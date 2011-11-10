require 'array_util'

class Array
  #
  # What can be impacted by the goodness score?
  #   - number of piles
  #   - number of cards to move at a time
  #

  def hindu_shuffle(goodness=0.0)
    n_elems = num_elems_per_div(goodness)
    if n_elems == size
      self
    else
      stacks = self.groups_of(n_elems)
      stacks.sort_shuffle.flatten
    end
  end

  def num_elems_per_div(goodness)
  end

  # 1..(size/2) | size
  def num_elems_per_div(goodness)
    if goodness == 1.0
      size
    else
      1 + (goodness * (size-2) / 2.0).ceil
    end
  end

end
