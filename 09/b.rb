numbers = File.readlines('input').map(&:to_i)

s = 0
e = 1
t = 15353384

while true
  sum = numbers[s..e].sum
  if sum == t
    puts numbers[s..e].min + numbers[s..e].max
    exit
  end
  s += 1 if sum > t
  e += 1 if sum < t
end
