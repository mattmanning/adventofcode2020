instructions = File.readlines('input')
pc = 0
acc = 0
visited = Hash.new

while true
  if visited[pc]
    puts acc
    exit
  end
  visited[pc] = true
  instruction = instructions[pc]
  case instruction[0..2]
  when 'acc'
    acc += instruction[4..-1].to_i
    pc +=1
  when 'nop'
    pc +=1
  when 'jmp'
    pc += instruction[4..-1].to_i
  end
end
