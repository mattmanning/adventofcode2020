def direction_check(x, y, s)
  c = 0
  i = x
  j = y
  while true
    i, j = *yield(i,j)
    c += 1 if s[[i,j]] == '#'
    break unless s[[i,j]] == '.'
  end
  c
end

def occupied_adjacent(x, y, s)
  count = direction_check(x, y, s) {|i,j| [i-1, j]}
  count += direction_check(x, y, s) {|i,j| [i+1, j]}
  count += direction_check(x, y, s) {|i,j| [i, j-1]}
  count += direction_check(x, y, s) {|i,j| [i, j+1]}
  count += direction_check(x, y, s) {|i,j| [i-1, j-1]}
  count += direction_check(x, y, s) {|i,j| [i-1, j+1]}
  count += direction_check(x, y, s) {|i,j| [i+1, j-1]}
  count += direction_check(x, y, s) {|i,j| [i+1, j+1]}
end

seats = Hash.new

File.read('input').split("\n").each_with_index do |line, x|
  line.split('').each_with_index { |v, y| seats[[x, y]] = v }
end

while true
  old_seats = seats.dup

  old_seats.each do |seat|
    if seat.last == 'L' && occupied_adjacent(*seat.first, old_seats) == 0
      seats[seat.first] = '#'
    elsif seat.last == '#' && occupied_adjacent(*seat.first, old_seats) >= 5
      seats[seat.first] = 'L'
    end
  end

  break if old_seats == seats
end

puts seats.inject(0) {|sum, s| (s.last == '#') ? sum + 1 : sum }
