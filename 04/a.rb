#!/usr/bin/env ruby

passports = File.read('input').split("\n\n").map { |p| Hash[*p.split(/\s|:/)]}
total = passports.inject(0) do |sum, p|
  keys = p.keys
  (keys.length == 8) || (keys.length == 7 && !keys.include?('cid')) ? sum+1 : sum
end
puts total
