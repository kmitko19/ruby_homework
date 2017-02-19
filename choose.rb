# Метод выбора транспортного средства (верхнего уровня)
def choose_veh
  puts "----------------------------------------------- \
      \n1.car  2.tram  3.bike \
      \n----------------------------------------------- \
      \nChoose vehicle (from 1 to 3): "
  input = gets.chomp
  input = input.to_i
  case input
    when 1
      # должен быть вызов метода класса Vehicle для экземпляра car
    when 2
      # должен быть вызов метода класса Vehicle для экземпляра tramp
    when 3
      # должен быть вызов метода класса Vehicle для экземпляра bike
    else
      puts "You entered an invalid value!"
      return false
  end
end

