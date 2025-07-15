#La manera en la que se abordó este ejercicio fue pensando en que las áreas se pueden ver como un conjunto de coordenas en el plano cartesiano, es decir, si tenemos un 
#réctangulo de área 4, entonces este se puede ver en el plano cartesiano como el conjunto {[0,0], [0,1], [1,0], [1,1]}. De esta forma, si queremos obtener el área 
#que se encuentra dentro de dos o más rectángulos, debemos considerar a las intersecciones entre dos o más rectángulos pero vistos como conjuntos de elementos en el
#plano de cartesiano, de esta forma, evitamos contar elementos de más a la hora de considerar todas las posibles intersecciones.

claims = []
set = Set.new
File.read('input.txt').each_line do |line|
  new_line = line.split(/(\d+)/).delete_if { |word| word =~ /#| @ |,|: |x/ }
  new_line.pop
  new_line.map! { |line| line.to_i }
  claims.push(new_line)
end

#primero, filtramos la información de nuestro archivo input.txt, acomodándola en un arreglo cuyos elementos son a su vez arreglos que contienen
# el id, la posición horizontal, la posición vértical, la anchura y la altura del rectángulo respectivamente. Así mismo, creamos un set de apoyo que nos servirá 
# para almacenar todas las posibles coordenadas que aparecen en las intersecciones.  

i = 0
j = i + 1



while i < claims.length

  support_array_1 = []

  claims[i][3].times do |h|
    claims[i][4].times do |k|
      support_array_1.push([claims[i][1] + h, (1000 - claims[i][2]) - k])
    end
  end

  while j < claims.length

    support_array_2 = []

    claims[j][3].times do |h|
      claims[j][4].times do |k|
        support_array_2.push([claims[j][1] + h, (1000 - claims[j][2]) - k])
      end
    end

    set |= (support_array_1.to_set & support_array_2.to_set)

    j += 1
  end
  i += 1
  j = i + 1

end

#En el ciclo anterior, lo que hacemos es comparar uno a uno los rectángulos que tenemos en el input, intersectarlos y guardar las coordenas en las que se intersectan
#en un set, de manera que al final del ciclo, tendremos dentro de nuestro set a todas las posibles intersecciones entre dos o más réctangulos. 

#pensando mejor un poco el ejercicio, quizá haya sido mejor idea primero transformar todos los rectángulos en sets con las coordenadas en el plano cartesiano, guardar esos 
#sets en un arreglo, y después hacer los ciclos, para así evitar hacer transformaciones de más. 

puts set.length
