#!/usr/bin/env ruby

def valid?(pass)
  return false if pass['byr'].nil? || !(1920..2002).cover?(pass['byr'].to_i)
  return false if pass['iyr'].nil? || !(2010..2020).cover?(pass['iyr'].to_i)
  return false if pass['eyr'].nil? || !(2020..2030).cover?(pass['eyr'].to_i)
  hgt_match = /(\d+)(cm|in)/.match(pass['hgt'])
  return false if hgt_match.nil?
  return false if (hgt_match[2] == 'in') && !(59..76).cover?(hgt_match[1].to_i)
  return false if (hgt_match[2] == 'cm') && !(150..193).cover?(hgt_match[1].to_i)
  return false if /(#)([0-9,a-f]{6})/.match(pass['hcl']).nil?
  return false if !['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include?(pass['ecl'])
  return false if pass['pid'].nil? || pass['pid'].length != 9
  true
end

passports = File.read('input').split("\n\n").map { |p| Hash[*p.split(/\s|:/)]}
puts passports.inject(0) {|sum, p| valid?(p) ? sum+1 : sum }
