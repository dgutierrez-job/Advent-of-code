numbers = []
File.read('input.txt').each_line do |line|
  numbers.push(line.to_i)
end

l = numbers.length
set = Set.new
i = 0
number = numbers[i]

while set.include?(number) == false
  set << number
  number += numbers[(i + 1) % l]
  i += 1
end

puts "#{number}"
