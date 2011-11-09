
class Array

  def windows(width)
    a = []
    each_window(width) {|w| a << w }
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

