#
# Monkey-patching class Array
# to add general-purpose methods.
#
class Array

  def groups_of(n)
    a = []
    each_group_of(n) {|elems| a << elems }
    a
  end

  def each_group_of(n)
    i = 0
    while i < size
      yield self[i,n]
      i += n
    end
  end

  # overlapping
  def windows(width)
    a = []
    each_window(width) {|win| a << win }
    a
  end

  def each_window(width)
    (0 .. (size - width)).each do |i|
      yield self[i,width]
    end
  end

  def swap_at_indices(i1, i2)
    e = self[i1]
    self[i1] = self[i2]
    self[i2] = e
    self
  end

  def same_elements?(other)
    (self.size == other.size) &&
      self.zip(other).all? {|(a,b)| a == b }
  end
  
  def all_uniq?
    elem_2_count.all? {|(_,v)| v == 1 }
  end

  # return Hash
  def elem_2_count
    self.inject({}) do |h, e|
      h[e] ||= 0
      h[e] += 1
      h
    end
  end

end

