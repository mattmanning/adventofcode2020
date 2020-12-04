#!/usr/bin/env ruby

pos = 0
trees = 0

File.open('input').each do |line|
  trees += 1 if line[pos] == '#'
  pos = ((pos + 3) % line.strip.length)
end

puts trees
