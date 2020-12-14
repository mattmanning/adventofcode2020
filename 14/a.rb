mem = Hash.new(0)
@mask = ''

def apply_mask(n)
  bs = "%036b" % n
  0.upto(35) {|i| bs[i] = @mask[i] unless @mask[i] == 'X'}
  bs.to_i(2)
end

File.readlines('input').each do |line|
  if line.start_with?('mask')
    @mask = line.split('mask = ')[1]
  else
    m = /mem\[(\d+)\]\s=\s(\d+)/.match(line)
    mem[m[1]] = apply_mask(m[2])
  end
end

puts mem.values.sum
