def adjacent(x, y)
  [
    [x-1,y-1],
    [x,y-1],
    [x+1,y-1],
    [x-1,y],
    [x+1,y],
    [x+1,y+1],
    [x,y+1],
    [x-1,y+1]
  ]
end

def occupied_adjacent(x, y, s)
  adjacent(x,y).select {|pos| s[[pos.first,pos.last]] == '#'}.count
end

seats = Hash.new('.')

File.read('input').split("\n").each_with_index do |line, x|
  line.split('').each_with_index { |v, y| seats[[x, y]] = v }
end

while true
  old_seats = seats.dup

  old_seats.each do |seat|
    if seat.last == 'L' && occupied_adjacent(*seat.first, old_seats) == 0
      seats[seat.first] = '#'
    elsif seat.last == '#' && occupied_adjacent(*seat.first, old_seats) >= 4
      seats[seat.first] = 'L'
    end
  end

  break if old_seats == seats
end

puts seats.inject(0) {|sum, s| (s.last == '#') ? sum + 1 : sum }
