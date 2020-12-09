numbers = File.readlines('input').map(&:to_i)

25.upto(numbers.length-1) do |i|
  unless numbers[i-25..i-1].combination(2).detect {|n| n.sum == numbers[i]}
    puts numbers[i]
    exit
  end
end
