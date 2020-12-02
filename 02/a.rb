#!/usr/bin/env ruby

total = File.open('input').inject(0) do |sum, line|
  cols = line.split(' ')
  range = Range.new(*cols[0].split('-').map(&:to_i))
  letter = cols[1].split(':')[0]
  appearances = cols[2].split('').count(letter)
  if range.cover?(appearances)
    sum + 1
  else
    sum
  end
end

puts total
