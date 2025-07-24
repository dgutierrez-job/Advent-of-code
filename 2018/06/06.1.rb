locations = []

File.read('input.txt').each_line do |location|
  locations << (location.split(',').map { |n| n.to_i })
end

dessired_region = []
 
(0..354).each do |x|
  
  (0..354).each do |y|

    distances = []
    
    locations.each do |location|
      distances.push ((location[0]-x).abs + (location[1]-y).abs)
    end
    
    dessired_region.push([x,y]) if distances.sum < 10000
    
  end  
  
end

puts dessired_region.length 
