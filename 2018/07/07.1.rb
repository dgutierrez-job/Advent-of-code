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

values = ("A".."Z").to_a

l = (steps_to_be_finish | steps_to_be_initial).length

init = (steps_to_be_finish - steps_to_be_initial).to_a.sort

initializers = []

i=0

init.each do |process|
  initializers.push([process, 60+(values.find_index(process))+1, i])
  i = i+1
end

initializers.push([nil,0,5])
 
finish_process = []


while finish_process.length < l

  next_process = []

  times = []

  initializers.each do |process|
      times.push(process[1]) unless process[0].nil?  
  end
  
  print "#{initializers}\n" 

  # print  times
  # puts finish_process.length 

  dessired_process_index = initializers.find_index{ |process| process[1] == times.min }
  finish_process.push(initializers[dessired_process_index][0])
  # init = init.sort
  # dessired_order.push(initializers[0])
  # finish_process = initializers.shift

  candidates_to_finish = steps.find_all{ |pair| pair[0] == finish_process.last }

  candidates_to_finish.each do |candidate|
    conditions = steps.find_all { |pair| pair[1] == candidate[1] }.map{ |condition| condition[0] }
    next_process.push(candidate[1]) if (conditions-finish_process).empty?  
  end
  

  if next_process.empty? 
    initializers[dessired_process_index][0] = nil
  else
    next_process = next_process.sort
    process_to_start = next_process.shift
    support_time = initializers[dessired_process_index][1]
    time = support_time + 60 + values.find_index(process_to_start)+1
    worker = initializers[dessired_process_index][2]
    initializers[dessired_process_index] = [process_to_start, time, worker]

    initializers.each do |process|

      if process[0].nil? && !next_process.empty?
        process_to_start = next_process.shift
        new_index = initializers.find_index(process)
        time = support_time + 60 + values.find_index(process_to_start)+1
        worker = initializers[new_index][2]
        initializers[new_index] = [process_to_start, time, worker]
      end

    end

  end

end

puts initializers 





