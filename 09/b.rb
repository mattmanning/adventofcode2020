numbers = File.readlines('input').map(&:to_i)

s = 0
e = 1
t = 15353384

while true
  range = numbers[s..e]
  sum = range.sum
  if sum == t
    puts range.min + range.max
    exit
  end
  s += 1 if sum > t
  e += 1 if sum < t
end
