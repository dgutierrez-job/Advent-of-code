list = []
File.read('input.txt').each_line do |line|
  list.push(line)
end

list = list.sort

list.map! { |lines| lines.gsub(/(\[\d+-\d+-\d+\s\d+:)/, '').gsub(/\]/, '') }

def to_num(n)
  n.match(/\d+/).to_s.to_i
end

def catch_id(n)
  n.match(/#\d+/).to_s
end

l = list.length
i = 0
data = []
data_numbers = []
id_s = Set.new
max = []

while (l - i - 1) > 0
  id = catch_id(list[i])
  support_array = []
  sleep = true
  while sleep
    s = 1
    if list[i + s].match?(/\d+\sf/)
      mins_sleep = (to_num(list[i + s + 1]) - to_num(list[i + s]))
      mins_sleep.times do |n|
        support_array.push(to_num(list[i + s]) + n)
      end
      s += 1
    else
      sleep = false
    end
    i += s
    sleep = false if list[i + 1].nil?

  end
  id_s << id
  support_array.unshift(id)
  data.push(support_array)
end

id_s.each do |id|
  ordered_data = []
  data.each do |array|
    ordered_data += array if array[0] == id
  end
  max.push(ordered_data.length)
  new_data = ordered_data.tally
  data_numbers.push(new_data)
end

puts data_numbers

data_numbers.map { |data| data.shift }
data = data_numbers.map { |data| data.max_by { |_key, value| value } }

# filter_data = data.map { |pairs| pairs[1] }
# id = filter_data.find_index(filter_data.max)
# puts filter_data.max
# puts data_numbers[id]
