# Домашнее задание
#   Написать программу пошаговой стратегии, пользуясь которой я могу:
#   • Создавать объекты автомобиля, велосипеда, дороги, светофора и его режима работы.
#   • Запускать на дорогу автомобили, чтобы они останавливались когда горит красный свет,
#     и ехали когда горит зеленый свет.
#   • Задача со звездочкой - спровоцировать аварию с поломкой светофора.
#===============================================================================================
# Решение
 
# Программа позволяет получить состояние дорожного движения в заданный момент времени
# Объекты движения: Автомобиль, Трамвай, Велосипед
# Регулировка движения: Светофор

# I. Описание объектов и общих методов

# 1.  Объект: Дорога
#      Свойства:   Длина
#      Методы:     Показать длину
#                  Задать(изменить) длину (только до начала движения)
# Длина маршрута
@route_length = 50
@flag_game = false
# Показать длину маршрута
def show_length
  puts "------------------------------------------- \
      \nValue of route length is #{@route_length} km \
      \n-------------------------------------------"
end
# Изменить длину маршрута
def change_length
  # проверка статуса игры
  if @flag_game == true 
    puts "----------------------------------------- \
        \nYou can't change the length of the route, \
        \nbecause the traffic is already activated! \
        \n-----------------------------------------"
  else    
    print "----------------------------------------- \
         \nValue of route length is #{@route_length} km \
         \nSet the new value of route length in km, \
         \nfor refusing press 'Enter': "
    input = gets.chomp
    # проверка введенного значения
    if  input == ""
      puts "------------------------------------------------------------- \
          \nRoute length hasn't changed and is equal to #{@route_length} km \
          \n-------------------------------------------------------------"
    elsif input.to_i <= 0
      puts "------------------------------------------------------------- \
          \nRoute length cann't be equal to the value of '#{input}' \
          \nRoute length hasn't changed and is equal to #{@route_length} km \
          \n-------------------------------------------------------------"
    else
      @route_length = input.to_i
      puts "------------------------------------------- \
          \nNew route length is #{@route_length} km \
          \n-------------------------------------------"
    end
  end
end

# -------------------------------------------------------------------

# 2.  Объект: Светофоры
#      Свойства:   Расположение
#                  Длительность разрешающего сигнала
#                  Длительность запрещающего сигнала
#      Состояние:  Движение разрешено
#                  Движение запрещено
#                  Исправен
#                  Неисправен
#      Методы:     Показать длительность разрешающего сигнала
#                  Задать длительность разрешающего сигнала
#                  Показать длительность запрещающего сигнала
#                  Задать длительность запрещающего сигнала
#                  Показать техническое состояние
#                  Сломать
#                  Исправить
#                  Показать текущее значение сигнала
# Параметры светофоров
@count_ligth = 0
@arr_ligth = []         # Массив светофоров
@coord_ligth = 0        # Дистанция от начала маршрута
@duration_green = 1     # Длительность разрешающего сигнала
@duration_red = 1       # Длительность запрещающего сигнала
@color_ligth = "green"  # Значение по умолчанию в начале движения
@status_ligth = true    # Техническое состояние по умолчанию в начале движения

# Запрос на создание массива сфетофоров
def create_ligths  
  while true
    print "--------------------------- \
         \nAdd Traffic light? (Y/N): "
    input = gets.chomp  # проверка запроса на продолжение создания светофора
    unless input  == "Y" or input  == "y"
      return
    end
    create_ligth
  end  
end

#Создание светофора
def create_ligth  
  if @count_ligth > 0
    arr = @arr_ligth[@count_ligth - 1]
    min_length = arr[0] + 1
  else
    min_length = 1
  end

  print "---------------------------------------------- \
       \nDefine distance from start of route (km) \
       \nValid value is from #{min_length} to #{@route_length}: "
  input = gets.chomp
  
  # проверка введенного значения
  if  input == "" #проверка на пустое значение
    puts "--------------------------------- \
        \nThe distance has not been defined \
        \n---------------------------------"
    return
  else
    input = input.to_i
  end

  if input <= 0 # проверка на положительное значение
    puts "--------------------------------------------------- \
        \nDistance cann't be equal to the value of '#{input}' \
        \nThe distance has not been defined \
        \n---------------------------------------------------"    
  elsif input > @route_length # проверка на max
    puts "--------------------------------------------------- \
        \nDistance cann't be more then value '#{@route_length}' \
        \nThe distance has not been defined \
        \n---------------------------------------------------"
  elsif input <= min_length # проверка на min
    puts "--------------------------------------------------- \
        \nDistance must be more than value '#{min_length}' \
        \nThe distance has not been defined \
        \n---------------------------------------------------"
  else
    @arr_ligth [@count_ligth] = [input, @duration_green, @duration_red,
                                 @color_ligth, @status_ligth]
    @count_ligth += 1  # создание элемента массива светофоров и увеличение счетчика
    puts "--------------------------------------------------------------- \
        \nSet Traffic light 'Ligth#{@count_ligth}' \
          on distance of #{input} km from route start \
        \n---------------------------------------------------------------"    
  end
end

# Показать светофоры и их состояние
def show_ligths
  if @arr_ligth.size == 0
    print "--------------------------------------------------- \
         \nTraffic lights do not exist. Want to create? (Y/N) "
    input = gets.chomp
    if input  == "Y" or input  == "y"
      create_ligths      
    end
    return
  end

  puts "Current state of Traffic ligths on the route \
      \n--------------------------------------------------------- \
      \n|  Name\t\t| Dist\t|T_Green| T_Red | Color | State |\
      \n---------------------------------------------------------"
  i=0
  @arr_ligth.each {|item| arr = item; i +=1; 
    puts "| Ligth#{i}\t|  #{arr[0]}\t|   #{arr[1]}\t|   #{arr[2]}\t| #{arr[3]}\t| #{arr[4]}\t| \
          \n---------------------------------------------------------"
    }
end

# Изменить парамектры светофора
def change_ligth
  if @arr_ligth.size == 0 # проверка наличия светофоров
    print "--------------------------------------------------- \
         \nTraffic lights do not exist. Want to create? (Y/N) "
    input = gets.chomp
    if input  == "Y" or input  == "y"
      create_ligths      
    end
    return
  end

  puts "------------------------------------------------------ \
      \nList of Traffic ligths:"
  i=0
  @arr_ligth.each {|item| arr = item; i +=1; 
    puts "Ligth#{i} "     
  }
  print "Select Traffic ligth (from 1 to #{@arr_ligth.size}): "
  ind = gets.chomp  # выбор светофора для изменения
  ind = ind.to_i
  if ind <= 0 || ind > @arr_ligth.size
    puts "You entered an invalid value!"
    return
  else
    puts "You chose Ligth#{ind}"
  end

  arr = @arr_ligth [ind - 1]
      # выбор новых параметров светофора
  puts "Current duration of green is #{arr[1]}"
  print "Enter new duration from 1 to 60: "
  input = gets.chomp
  input = input.to_i
  if input <= 0 || input > 60
    puts "You entered an invalid value!"
  else
    arr[1] = input
  end
  puts "Current duration of red is #{arr[2]}"
  print "Enter new duration from 1 to 60: "
  input = gets.chomp
  input = input.to_i
  if input <= 0 || input > 60
    puts "You entered an invalid value!"
  else
    arr[2] = input
  end
  puts "Current color on start is #{arr[3]}"
  print "To change the color? (Y/N): "
  input = gets.chomp
  if input  == "Y" or input  == "y"
    arr[3] == "green"? arr[3] = "red" : arr[3] = "green"  
  end
  puts "Current state on start is #{arr[4]}"
  print "To change the state? (Y/N): "
  input = gets.chomp
  if input  == "Y" or input  == "y"
    arr[4] == true ? arr[4] = false : arr[4] = true   
  end
        # сохранение новых параметров светофора и вывод на сонсоль
  @arr_ligth[ind - 1] = arr

  puts "New state of Traffic ligths on the route \
      \n--------------------------------------------------------- \
      \n|  Name\t\t| Dist\t|T_Green| T_Red | Color | State |\
      \n---------------------------------------------------------"
  puts "| Ligth#{ind}\t|  #{arr[0]}\t|   #{arr[1]}\t|   #{arr[2]}\t| #{arr[3]}\t| #{arr[4]}\t| \
      \n---------------------------------------------------------"
end

# -----------------------------------------------------------------

# 3.  Объект: Транспортное средство
#      Свойства:   Вид транспортного средства   
#                  Скорость
#      Состояние:  Стоит на месте
#                  Двигается
#                  Исправно
#                  Неисправно
#                  Дорога закончилась
#      Методы:     Показать скорость
#                  Задать(изменить) скорость
#                  Показать текущее состояние движения
#                  Остановить
#                  Начать движение
#                  Показать текущее техническое состояние
#                  Сломать
#                  Отремонтировать
#                  Показать текущее расположение на дороге

class Vehicle
  def initialize(type, speed = 20)
    @type = type
    @speed = speed
    @move_state = "stand" # stand | move
    @tech_state = true    # true (исправно) | false (неисправно) / nill
    @last_loc = 0         # последнее расположение на маршруте     
  end

  attr_accessor :speed, :move_state, :tech_state
  attr_reader :type

# Метод изменения скорости транспортного средства  
  def change_speed    
    puts "-------------------------------------------- \
        \nType: #{@type}   Current speed: #{@speed} \
        \n--------------------------------------------"
    print "Enter new speed of vehicle (from 1 to 200): "    
    input = gets.chomp
    input = input.to_i
    if input <= 0 || input > 200
      puts "You entered an invalid value!"
      return
    else
      @speed = input
      puts "-------------------------------------------- \
          \nType: #{@type}   New speed: #{@speed} \
          \n--------------------------------------------"
    end
  end
end

# Метод изменения статуса движения транспортного средства  
  def change_move    
    puts "-------------------------------------------- \
        \nType: #{@type}   Current state: #{@move_state} \
        \n--------------------------------------------"
    print "To change the state? (Y/N): "
    input = gets.chomp
    if input  == "Y" or input  == "y"
      @move_state = "moves"
      puts "-------------------------------------------- \
          \nType: #{@type}   New state: #{@move_state} \
          \n--------------------------------------------" 
    else    
      puts "-------------------------------------------- \
          \nValue hasn't change \
          \n--------------------------------------------"
      return    
    end
  end

  # Метод изменения технического состояния транспортного средства  
  def change_tech    
    puts "-------------------------------------------- \
        \nType: #{@type}   Current state: #{@tech_state} \
        \n--------------------------------------------"
    print "To change the state? (Y/N): "
    input = gets.chomp
    if input  == "Y" or input  == "y"
      @move_state = false
      puts "-------------------------------------------- \
          \nType: #{@type}   New state: #{@tech_state} \
          \n--------------------------------------------" 
    else    
      puts "-------------------------------------------- \
          \nValue hasn't change \
          \n--------------------------------------------"
      return    
    end
  end

  def show_loc
    puts "-------------------------------------------- \
        \nType: #{@type}   Current location: #{} \
        \n--------------------------------------------"
  end

end

vaz = Vehicle.new("car", 60)

vityaz = Vehicle.new("tram", 40)

hvz = Vehicle.new("bike", 20)



# 4.  Метод: Общее состояние дорожного движения на заданный момент времени от начала движения
def monitor
  if @arr_ligth.size == 0
    print "--------------------------------------------------- \
         \nTraffic lights do not exist \
         \n---------------------------------------------------"
  else
    puts "Current state of Traffic ligths on the route \
        \n--------------------------------------------------------- \
        \n|  Name\t\t| Dist\t|T_Green| T_Red | Color | State |\
        \n---------------------------------------------------------"
    i=0
    @arr_ligth.each {|item| arr = item; i +=1; 
    puts "| Ligth#{i}\t|  #{arr[0]}\t|   #{arr[1]}\t|   #{arr[2]}\t| #{arr[3]}\t| #{arr[4]}\t| \
        \n---------------------------------------------------------"    
  end
end

#***********************************************************************************************
#************************ Дальше в работе ******************************************************
#***********************************************************************************************

# I. Общий алгоритм выполнения программы

# 1. Вход в программу
#       Приветствие запрос имени: если "", то выход (6.)
#       Предложение поиграть: если "" или No, то выход (6.)

# 2. Задание исходных данных:
#     - длина дороги (км)
#     - расстановка светофоров (км от начала дороги), задание длительности сигналов (мин)
#       и исходное состояние
#     - задание средней скорости транспортных средств (км/ч), их исходного
#       расположения (км от начала дороги) и их текущего состояния
# 2.1 Вывод параметров по умолчанию
# 2.2 Предложение изменить исходные параметры: если "" или No, то переход к запуску (3.)
# 2.3 Ввод длины дороги (км): если "" или < 1, то сообщение об ошибке и предложение ввести
#     данные повторно, либо отказаться
# 2.4 Расстановка светофоров (км от начала дороги). Каждый следующий светофор должен стоять
#     дальше по дороге от предыдущего. Задание текущего состояния.
#     Проверки на корректность ввода, как в 2.3
# 2.5 Ввод средней скорости для каждого транспортного средства, их расположение на дороге и
#     текущего состояния 

# 3. Запуск движения

# 4. Изменение состояния светофоров и транспортных средств. Задается время в мин от начала
#    движения, но не ранее последнего времени мониторинга или предыдущего изменения состояния

# 5. Мониторинг состояния дорожного движения на заданный момент времени (мин с начала старта),
#    но не ранее последнего времени  изменения состояния или предыдущего мониторинга

# 6. Выход из программы



