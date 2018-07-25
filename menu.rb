require 'csv'

def metodo(nota)
  CSV.foreach("alumnos.csv",) do |row|
    suma = row[1].to_f + row[2].to_f + row[3].to_f + row[4].to_f + row[5].to_f
    promedio = (suma/5).to_f
    puts "el alumno #{row[0]} ha aprobado" if promedio >= nota
  end
end

puts '           MENU         '
puts '1. generar un archivo con el nombre de cada alumno y el
promedio de sus notas.'
puts '2. mostrar la cantidad de inasistencias totales'
puts '3. mostrar los nombres de los alumnos aprobados'
puts '4. Salir'

option = gets.chomp.to_i
while option != 4
  case option
      when 1
        file = File.open('alumnosypromedios.csv', 'w')
        CSV.foreach("alumnos.csv",) do |row|
          file.puts "alumno: " + row[0]
          suma = row[1].to_f + row[2].to_f + row[3].to_f + row[4].to_f + row[5].to_f
          file.puts "promedio: "+ (suma/5).to_s
          file.puts "-------------------"
        end
        file.close
      when 2
         inasistencias = 0
         CSV.foreach("alumnos.csv",) do |row|
           row.each do |col|
             puts inasistencias  += 1 if col==" A"
           end
         end
         puts "inasistencias:" + inasistencias.to_s
      when 3
        puts ' ingresa una nota de aprobación'
        notas = gets.chomp.to_i
        metodo(notas)
      else
        puts 'ingresa un número de opción valido'
  end
  puts '           MENU         '
  puts '1. generar un archivo con el nombre de cada alumno y el promedio de sus notas.'
  puts '2. mostrar la cantidad de inasistencias totales'
  puts '3. mostrar los nombres de los alumnos aprobados'
  puts '4. Salir'
  option = gets.chomp.to_i
end
