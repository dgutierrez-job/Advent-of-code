locations = []

File.read('input.txt').each_line do |location|
  locations << (location.split(',').map { |n| n.to_i })
end

bounds = []

locations.each do |location|
  bounds.push(location.max)
end

max_bound = bounds.max

locations_closest_coordinates = Array.new(locations.length){Set.new}

i=0

infinity_tester = Array.new(locations.length){Set.new}

2.times do |j|

  puts j

  (i..max_bound).each do |x|

    puts x

    (i..max_bound).each do |y|

      distances = {}
      
      locations.each do |location|
        distances[location] = ((location[0]-x).abs + (location[1]-y).abs)
      end

      
      min_distance = distances.min_by{|key,value| value} 
      
      if (distances.find_all{|key, value| value == min_distance.last }).length == 1 && i == 0
        index = locations.find_index(min_distance.first)
        locations_closest_coordinates[index] << [min_distance.first, [x,y], min_distance.last]
        
      elsif (distances.find_all{|key, value| value == min_distance.last }).length == 1 && i == -max_bound
        index = locations.find_index(min_distance.first)
        infinity_tester[index] << [min_distance.first, [x,y], min_distance.last]
      end

    end  
    
  end
  
  i = -max_bound
    
end

finite_areas = []

locations.length.times do |i|
  finite_areas.push(locations_closest_coordinates[i].length) if locations_closest_coordinates[i].length == infinity_tester[i].length
end

puts finite_areas.max






