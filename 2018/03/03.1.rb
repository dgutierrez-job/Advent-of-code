claims = []
dessired_claim = []
set = Set.new
File.read('input.txt').each_line do |line|
  new_line = line.split(/(\d+)/).delete_if { |word| word =~ /#| @ |,|: |x/ }
  new_line.pop
  new_line.map! { |line| line.to_i }
  claims.push(new_line)
end

#Siguiendo una idea parecida a la del ejercicio anterior, en esta parte hacemos un ciclo sobre la longitud total de nuestro arreglo claims, que es el que guarda
#la información de cada uno de nuestros rectángulos. En este ciclo lo que hacemos es que en cada iteración, eliminamos el i-ésimo elemento de nuestro arreglo 
#claims, guardando dicho elemento en una variable b. Seguido de eso, transformamos al elemento b en un set con sus respectivas coordenas cartesianas, mientras que
#al arreglo claims (que no tiene al elemento b) lo transformamos también en un set con todas las coordenas de los réctangulos que obtenemos de la información que tenemos
#en el arreglo claims. Finalmente, comparamos ambos sets, y si su intersección es vacía, salimos del ciclo almacenando a la variable b. 

(claims.length).times do |i|

  support_array_1= []
  support_array_2=[]

  b = claims.delete_at(i)

    b[3].times do |h|
      b[4].times do |k|
          support_array_1.push([b[1]+h, (1000-b[2])-k])
      end
    end

  claims.each do |claim|
    claim[3].times do |h|
      claim[4].times do |k|
        support_array_2.push([claim[1]+h, (1000-claim[2])-k])
      end
    end
  end
  
  claims.insert(i,b)


  if (support_array_1.to_set).disjoint?(support_array_2.to_set)
    dessired_claim.push(b)
    break

  end

end

puts dessired_claim




