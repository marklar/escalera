require 'array_util'

#
# Monkey-patching class Array
# to add methods specific to pile shuffling.
#
# Shuffling is a generic operation on Arrays
# and need know nothing of cards or decks, etc.
#
class Array
  RAND_THEN_FIXED = true

  def pile_shuffle(goodness=0.0)
    if RAND_THEN_FIXED
      random_distro_fixed_stack_shuffle(goodness)
    else
      fixed_distro_random_stack_shuffle(goodness)
    end
  end

  # Does NOT mutate ary.
  def random_distro_fixed_stack_shuffle(goodness=0.0)
    piles = create_empty_piles(goodness)
    ary = self.dup
    # random distro
    while (! ary.empty?)
      piles.each do |p|
        p << ary.shift unless ary.empty?
      end
      piles.knuth_shuffle!
    end
    # fixed stack
    piles.flatten
  end

  # Does NOT mutate ary.
  def fixed_distro_random_stack_shuffle(goodness=0.0)
    piles = create_empty_piles(goodness)
    ary = self.dup
    # fixed distro
    while (! ary.empty?)
      piles.each do |p|
        p << ary.shift unless ary.empty?
      end
    end
    # random stack
    piles.knuth_shuffle!
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
