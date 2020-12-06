#!/usr/bin/env ruby

total = File.read('input').split("\n\n").inject(0) do |sum, group|
  words = group.split("\n")
  sum + words.inject(words.first.split('')) {|i, w| i & w.split("")}.length
end
puts total
