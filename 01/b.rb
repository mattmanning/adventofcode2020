 #!/usr/bin/env ruby

 puts File.open('input').map(&:to_i).combination(3).detect { |c| c.sum == 2020 }.inject(&:*)
