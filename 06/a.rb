#!/usr/bin/env ruby

puts File.read('input').split("\n\n").inject(0) { |total, group| total + group.delete("\n").split('').uniq.length }
