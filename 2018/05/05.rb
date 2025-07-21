polymer = File.read('input.txt').strip

reaction = true
i = 0

while reaction

  l = polymer.length

  if polymer[i].match?(/[a-z]/) && polymer[i + 1].match?(/[A-Z]/) && polymer[i].upcase == polymer[i + 1] || polymer[i].match?(/[A-Z]/) && polymer[i + 1].match?(/[a-z]/) && polymer[i].downcase == polymer[i + 1]
    polymer = polymer.gsub(polymer[i] + polymer[i + 1], '')
    i = 0
  else
    i += 1
  end

  reaction = false if i + 1 >= l

end

puts(polymer.length)
