two_times = 0
three_times = 0
File.read('input.txt').each_line do |line|
  word = line.split('').tally
  two_times += 1 if word.select { |key| word[key] == 2 }.length > 0
  three_times += 1 if word.select { |key| word[key] == 3 }.length > 0
end

puts "#{two_times * three_times}"
