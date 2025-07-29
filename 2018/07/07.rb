steps = []
File.read('input.txt').each_line do |line|
  pairs = line.gsub(/Step\s/, '').gsub(/\smust\sbe\sfinished\sbefore\sstep\s/, '').gsub(/\scan\sbegin\./, '').gsub(/\n/,
                                                                                                                   '')
  steps.push(pairs)
end

steps_to_be_finish = Set.new
steps_to_be_initial = Set.new

steps.each do |step|
  steps_to_be_finish << step[0]
  steps_to_be_initial << step[1]
end

l = (steps_to_be_finish | steps_to_be_initial).length

initializers = (steps_to_be_finish - steps_to_be_initial).to_a

dessired_order = []

while dessired_order.length < l 
  initializers = initializers.sort
  dessired_order.push(initializers[0])
  finish_process = initializers.shift

  candidates_to_finish = steps.find_all{ |pair| pair[0] == finish_process }

  candidates_to_finish.each do |candidates|
    conditions = steps.find_all { |pair| pair[1] == candidates[1] }.map{ |condition| condition[0] }
    initializers.push(candidates[1]) if (conditions-dessired_order).empty?  
  end
end

puts dessired_order.join 



