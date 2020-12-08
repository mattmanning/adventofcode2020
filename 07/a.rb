bag_hash = Hash.new([])

File.read('input').split("\n").each do |line|
	split = line.split(' bags contain ')
	outer = split[0]
	inner = split[1][0..-2].split(', ')
	inner.each do |bag|
		color = /\d\s(.*)\sbag/.match(bag).to_a[1]
		bag_hash[color] = (bag_hash[color] + [outer]).uniq
	end
end

sgb = bag_hash['shiny gold']
counter = 0
counted = []

while !sgb.empty?
	sgb += bag_hash[sgb.first]
	sgb.uniq!
	sgb -= counted
	counted << sgb.shift
	counter += 1
end

puts counter
