require 'array_util'

class Array
  USE_RANDOM_DISTRO = true

  def pile_shuffle(goodness=0.0)
    if USE_RANDOM_DISTRO
      random_distro_fixed_stack_shuffle(goodness)
    else
      fixed_distro_random_stack_shuffle(goodness)
    end
  end

  # Does NOT mutate ary.
  def random_distro_fixed_stack_shuffle(goodness=0.0)
    piles = create_empty_piles(goodness)
    ary = self.dup
    while (! ary.empty?)
      piles.knuth_shuffle!  # random distro
      piles.each do |p|
        p << ary.shift unless ary.empty?
      end
    end
    piles.flatten   # fixed stack
  end

  # Does NOT mutate ary.
  def fixed_distro_random_stack_shuffle(goodness=0.0)
    piles = create_empty_piles(goodness)
    ary = self.dup
    while (! ary.empty?)
      # fixed distro
      piles.each do |p|
        p << ary.shift unless ary.empty?
      end
    end
    piles.knuth_shuffle!   # random stack
    piles.flatten
  end

  def create_empty_piles(goodness)
    n_piles = num_piles(goodness)
    (0...n_piles).map { [] }
  end

  # 1..count
  def num_piles(goodness)
    (self.size - (goodness * (self.size-1))).ceil
  end

end
