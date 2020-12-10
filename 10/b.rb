runs = []
cnt = 1
prev = 0

nums = File.readlines('input').map(&:to_i).sort
nums = [0] + nums + [nums[-1]+3]
nums.each do |num|
  if num - prev == 1
    cnt += 1
  else
    runs += [cnt - 2] if cnt > 2
    cnt = 1
  end
  prev = num
end

puts runs.inject(1) {|prod, n| prod * (2**n - [0, n-2].max)}
