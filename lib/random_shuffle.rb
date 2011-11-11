require 'array_util'

#
# Monkey-patching class Array
# to add methods specific to (various levels of) random shuffling.
#
class Array
  if RUBY_VERSION == '1.9.2'
    R = Random.new
  end

  def rand_int(range)
    if defined? R
      R.rand(range)
    else
      range.first + rand(range.last)
    end
  end

  # http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
  # aka Fisher-Yates.  Linear-time algo.
  # Uses randomness with*out* replacement, so is optimally random.
  # MUTATES ary.
  def knuth_shuffle!
    (self.size - 1).downto(1) do |i|
      j = rand_int(0..i)
      self.swap_at_indices(i, j)
    end
    self
  end

  # Does NOT mutate ary.
  # O(n log n).  Not in constant space, either.
  # Uses randomness *with* replacement.
  # Variable randomness.
  # The quality of randomness increases with the number of "piles".
  def sort_shuffle(num_piles=100_000)
    self.
      map {|e| [rand_int(0..num_piles), e] }.  # Assign random num to each.
      sort {|a,b| a[0] <=> b[0] }.             # Sort by random num.
      map {|(_,c)| c }
  end

  # Completely UN-random.
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

end
