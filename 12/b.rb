pos = [0, 0]
@wp = [10, 1]

def radians(deg)
  deg * (Math::PI / 180.0)
end

def rotate(dir)
  case dir
  when 90
    @wp = [-1 * @wp[1], @wp[0]]
  when 180
    @wp = [-1 * @wp[0], -1 * @wp[1]]
  when 270
    @wp = [@wp[1], -1 * @wp[0]]
  else
    @wp
  end
end

File.read('input').split("\n").each do |line|
  m = /(\w)(\d+)/.match(line)
  case m[1]
  when 'N'
    @wp[1] += m[2].to_i
  when 'E'
    @wp[0] += m[2].to_i
  when 'S'
    @wp[1] -= m[2].to_i
  when 'W'
    @wp[0] -= m[2].to_i
  when 'L'
    rotate(m[2].to_i % 360)
  when 'R'
    dir = 360 - (m[2].to_i % 360)
    rotate(dir)
  when 'F'
    pos[0] += m[2].to_i * @wp[0]
    pos[1] += m[2].to_i * @wp[1]
  end
end

puts pos[0].abs + pos[1].abs
