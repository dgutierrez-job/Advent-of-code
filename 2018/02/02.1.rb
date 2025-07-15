words = []
File.read('input.txt').each_line do |line|
  words.push(line)
end

words.map! { |word| word.split('') }

l = words.length
i = 0
len = words[0].length
dessired_word = []

while dessired_word.empty? do 
  (l-(i+1)).times do |j|
    j = j+i+1
    support_index = []
    len.times do |q|
      if words[i][q] != words[j][q] 
      support_index.push(q)
      end
    end

    if support_index.length == 1 
      words[i].delete_at(support_index[0])
      dessired_word = words[i]
      break
    end

    end
    i =i+1
  end



puts "#{dessired_word.join}"
