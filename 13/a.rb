lines = File.read('input').split("\n")
target = lines[0].to_i

h = Hash.new
lines[1].split(',').select {|n| /\d+/.match(n)}.each do |n|
  n = n.to_i
  h[n - (target % n)] = n
end

puts h[h.keys.min] * h.keys.min
