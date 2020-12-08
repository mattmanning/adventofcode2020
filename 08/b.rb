File.read('input').split("\n").each_with_index do |line, i|
  next if line[0..2] == 'acc'
  instructions = File.read('input').split("\n")
  pc = 0
  acc = 0
  visited = Hash.new

  while true
    if instructions[pc].nil?
      puts acc
      exit
    end
    if visited[pc]
      break
    end
    visited[pc] = true
    instruction = instructions[pc]
    if pc == i
      instruction[0..2] = 'nop' if instruction[0..2] == 'jmp'
      instruction[0..2] = 'nop' if instruction[0..2] == 'jmp'
    end
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
end
