input = 9,19,1,6,0,5,4
loops = 30_000_000
h = Hash.new([])

input.each_with_index {|n,i| h[n] = [i+1]}

last = input.last
count = input.length

while count < loops
  h[last] = [count] + h[last]
  h[last] = h[last][0..1] if h[last].length > 2
  last = h[last].first - h[last].last
  count += 1
end

puts last
