numbers = File.read('input').split("\n")[1].split(',').map
  .with_index {|n,i| [n, i]}.select {|n| /\d+/.match(n[0])}
  .map {|n| [n[0].to_i, n[1]]}.sort_by(&:first)

number = numbers.pop
t = number.first - number.last
inc = number.first

while true
  m = numbers.select {|n| ((t + n.last) % n.first) == 0}
  inc = m.inject(inc) {|p,n| p*n.first}
  numbers -= m
  break if numbers.length == 0
  t += inc
end

puts t
