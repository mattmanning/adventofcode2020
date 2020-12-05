#!/usr/bin/env ruby

def decode(str)
  s = str.gsub(/F|L/, '0').gsub(/B|R/, '1')
  s[0..6].to_i(2) * 8 + s[7..9].to_i(2)
end

puts File.open('input').map {|p| decode(p)}.max