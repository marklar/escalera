
$r = Random.new

# Monkey-patch?
def random_idx(ary)
  $r.rand(0 ... ary.size)
end

def swap(ary, i1, i2)
  a = ary[i1]
  ary[i1] = ary[i2]
  ary[i2] = a
  ary
end

def same_elements?(ary1, ary2)
  (ary1.size == ary2.size) &&
    ary1.zip(ary2).all? {|(a,b)| a == b }
end

def all_uniq?(ary)
  elem_2_count(ary).all? {|(_,v)| v == 1 }
end

def elem_2_count(ary)
  ary.inject({}) do |h, e|
    h[e] ||= 0
    h[e] += 1
    h
  end
end
