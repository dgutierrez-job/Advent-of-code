polymer = File.read('input.txt').strip

reaction = true
i = 0

while reaction

  l = polymer.length

  if polymer[i].upcase == polymer[i + 1] || polymer[i] == polymer[i + 1].upcase
    # polymer.delete_at(i + 1)
    # polymer.delete_at(i)
    polymer = polymer.gsub(polymer[i] + polymer[i + 1], '')
    i = 0
  else
    i += 1
  end

  reaction = false if i + 1 >= l

end

puts polymer
puts(polymer.length)
