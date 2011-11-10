require 'array_util'

class Array
  R = Random.new

  # Does NOT mutate ary.
  # O(n log n).  Not in constant space, either.
  BIG_NUM = 100_000
  def sort_shuffle
    self.
      map {|e| [R.rand(0..BIG_NUM), e] }.  # Assign random num to each.
      sort {|a,b| a[0] <=> b[0] }.         # Sort by random num.
      map {|(_,c)| c }
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
