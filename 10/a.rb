d = File.readlines('input').map(&:to_i).sort.inject([0,0,0]) do |diffs, num|
  case num - diffs[2]
  when 1
    diffs[0] += 1
  when 3
    diffs[1] += 1
  end
  diffs[2] = num
  diffs
end
    
puts d[0] * (d[1] + 1)
