#!/usr/bin/env ruby

total = File.open('input').inject(0) do |sum, line|
  cols = line.split(' ')
  positions = cols[0].split('-').map(&:to_i)
  letter = cols[1].split(':')[0]
  appearances = cols[2].split('').count(letter)
  if (cols[2][positions[0]-1] == letter) ^ (cols[2][positions[1]-1] == letter)
    sum + 1
  else
    sum
  end
end

puts total
