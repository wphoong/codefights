require 'benchmark'
require 'set'

def first_duplicate(a)
  beginning = Set.new

  a.each { |x| 
      return x if beginning.include?(x)
      beginning << x
    }
    -1
end

=begin
1. create a new set
2. iterate through array
    check if x is in beginning set
      if true, return x
    push x into beginning set
3. return -1 when above doesn't execute
=end

def first_duplicate2(a)
  found = {}
  a.each do |x|
    return x if found[x]
    found[x] = true
  end
  -1
end

=begin
1. create an empty hash
2. iterate through array
    if x in hash is true, return x
    otherwise, set x in hash = true
3. when above return doesn't execute,
  return -1 
    
=end

puts first_duplicate([1,4,8,2,3,4,2,1]) # 4
puts first_duplicate([8, 4, 6, 2, 6, 4, 7, 4, 9, 5, 8]) # 6
puts first_duplicate([ 2, 2]) # 2
puts first_duplicate([ 3, 3, 3]) # 3
puts first_duplicate([ 1, 2, 3]) # -1


# Run benchmark to check which solution has a faster runtime
b = [8, 4, 6, 2, 6, 4, 7, 4, 9, 5, 8, 1, 4, 8, 2, 3, 4, 2, 1]

Benchmark.bm do |x|
  x.report('first_duplicate') { first_duplicate(b) }
end