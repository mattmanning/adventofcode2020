@mem = Hash.new(0)
@mask = ''

def apply_masks(addr, num)
  xs = @mask.split('').select{|c| c == 'X'}.count
  vs = (0..(2**xs - 1)).map {|n| "%0#{xs}b" % n}
  vs.each do |v|
    v = v.split('')
    bs = "%036b" % addr
    0.upto(35) do |i|
      case @mask[i]
      when '1'
        bs[i] = '1'
      when 'X'
        bs[i] = v.shift
      end
    end
    @mem[bs.to_i(2)] = num.to_i
  end
end

File.readlines('input').each do |line|
  if line.start_with?('mask')
    @mask = line.split('mask = ')[1]
  else
    m = /mem\[(\d+)\]\s=\s(\d+)/.match(line)
    apply_masks(m[1], m[2])
  end
end

puts @mem.values.sum
