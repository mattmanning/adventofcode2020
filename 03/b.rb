#!/usr/bin/env ruby

class Slope
	attr_accessor :x, :y, :pos, :trees

	def initialize(x, y)
		@x, @y, @pos, @trees = x, y, 0, 0
	end
end

slopes = [
	Slope.new(1, 1),
	Slope.new(3, 1),
	Slope.new(5, 1),
	Slope.new(7, 1),
	Slope.new(1, 2)
]

File.open('input').each_with_index do |line, i|
	slopes.each do |slope|
		if i % slope.y == 0
		  slope.trees += 1 if line[slope.pos] == '#'
		  slope.pos = ((slope.pos + slope.x) % line.strip.length)
		end
	end
end

puts slopes.map(&:trees).inject(&:*)
