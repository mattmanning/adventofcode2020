pos = [0, 0]
dir = 0

def radians(deg)
  deg * (Math::PI / 180.0)
end

File.read('input').split("\n").each do |line|
  m = /(\w)(\d+)/.match(line)
  case m[1]
  when 'N'
    pos[1] += m[2].to_i
  when 'E'
    pos[0] += m[2].to_i
  when 'S'
    pos[1] -= m[2].to_i
  when 'W'
    pos[0] -= m[2].to_i
  when 'L'
    dir = (dir + m[2].to_i) % 360
  when 'R'
    dir = (dir - m[2].to_i) % 360
  when 'F'
    pos[0] += m[2].to_i * Math::cos(radians(dir)).round
    pos[1] += m[2].to_i * Math::sin(radians(dir)).round
  end
end

puts pos[0].abs + pos[1].abs