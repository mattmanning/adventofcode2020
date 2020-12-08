bag_hash = Hash.new([])

File.read('input').split("\n").each do |line|
  split = line.split(' bags contain ')
  outer = split[0]
  inner = split[1][0..-2].split(', ')
  inner.each do |bag|
    m = /(\d+)\s(.*)\sbag/.match(bag).to_a
    next if m.empty?
    bag_hash[outer] = (bag_hash[outer] + [[m[2], m[1].to_i]])
  end
end

sgb = bag_hash['shiny gold']

counter = 0
counted = []

while !sgb.empty?
  sgb += bag_hash[sgb.first.first].map {|b| [b.first, b.last*sgb.first.last]}
  counter += sgb.first.last
  counted << sgb.shift
end

puts counter
