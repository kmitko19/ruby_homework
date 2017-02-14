 # 1. Что выведет этот код? Почему перменная @message доступна в методе make_some_voice()

class Geek
  def initialize
    @message = "ruby ruby"
  end

  def make_some_voice
    "I like to #{@message}"
  end
end

alex = Geek.new
puts alex.make_some_voice()

=begin
На консоль будет выведено:

I like to ruby ruby

переменная @message объявлена как переменная экземпляра класса и доступна создаваемому экземпляру
после инициализации в момент вызова метода
=end

# 2. Что этот код напечатает в STDOUT? Поясните.
class Computer
  def initialize
    @sound = "beep beep"
  end

  def self.about
    "Sometimes I go #{@sound}"
  end
end

p Computer.about

=begin
Так как переменная @sound объявлена как переменная экземпляра класса, то при вызова метода
из самого класса она не будет инициализирована и на печать выведется:

 "Sometimes I go "

 Если команду вывода написать следующим образом:

 p Computer.new.about

 т.е. вызвать метод из экземпляра класса, то будет выведено:

 "Sometimes I go beep beep"
  
=end

# 3. Что этот код напечатает в STDOUT?

class Xyz
  def pots
    @nice
  end
end

xyz = Xyz.new
p xyz.pots

# =>nil


# 4. Что этот код напечатает в STDOUT?

class Xyz
  def paper
    unassigned_local_variable
  end
end

xyz = Xyz.new
p xyz.paper

# Будет выдано сообщение об ошибке в связи с тем, что локальная переменная (или метод)
# "unassigned_local_variable" не определена

# 5. Что этот код напечатает в STDOUT? Поясните что произойдет если метод meaning_of_life()
# вызвать несколько раз для одного объекта.

class Something
  def meaning_of_life
    @result ||= result
    "The meaning of life is the number #{@result}"
  end

  def result
    Math.log10(100) * 42 - 48 - 13
  end
end

something = Something.new
p something.meaning_of_life

=begin
  Будет выведено:

  "The meaning of life is the number 23.0"

При первом вызове переменной @result будет присвоено значение 23.0 путем вызова метода result,
 т.к. при первом вызове при логическом сравнении значение @result => nil, что равнозначно False.
 При последующих вызовах переприсвоения @result (т.е. вызова метода result) не будет, т.к.
 значение @result => 23.0, т.е. True.
=end

# 6. Что этот код напечатает в STDOUT? Поясните.

class Cup
  PURPOSE = "hold liquids"
  def main_use
    PURPOSE
  end
end

tea_cup = Cup.new
p tea_cup.main_use

# Объявлена константа PURPOSE и ей присвоено значение "hold liquids".
# Будет напечатан следующий текст:
# "hold liquids"

# 7. Что этот код напечатает в STDOUT? Поясните.

class Chair
  AGE = "been around the block"
  def self.about
    "I'm old and I've #{AGE}"
  end
end

p Chair.about

# Объявлена константа AGE и ей присвоено значение "been around the block".
# Так как константа объявлена в теле класса, то ее значение будет доступно методу #about
# Будет напечатано:
# "I'm old and I've been around the block"

# 8. Что этот код напечатает в STDOUT? Поясните.

BEST_MOVIE = "Viking"
BEST_MOVIE = "Matilda"
p BEST_MOVIE

# Будет напечатано:
# "Matilda"
# т.к. значение переменной было переприсвоено

# 9. Что этот код напечатает в STDOUT? Поясните.

class Bottle
  DRANK = "lemme hit that"
end

p Bottle::DRANK

# Будет напечатано:
# "lemme hit that"
# т.к. посредством унарного опрератора :: идет обращение к константе, объявленной в классе
# Bottle

# 10. Поясните следующее утвреждение: "В руби все есть объект, так что нет не"
Explain the following statement: "Все в Ruby является объектом, так что нет никаких
автономных функций в Ruby, все функции на самом деле методы".

=begin
Т.к. Ruby является объектно-ориентированным языком программирования, то он манипулирует
понятиями объектов к которым могут быть применены методы. Метод является частью объекта,
и метод представляет действие объекта
=end

# 11. Поясните почему метод Pig#main_desire может обращаться к методу weight() без префикс self.

class Pig
  def weight()
    "100 kg"
  end

  def main_desire()
    "eat all day and be more than #{weight()}"
  end
end

piggy = Pig.new()
piggy.main_desire()

# У каждого метода должен быть приемник, а если приемник не указан, то подразумевается,
# что приемником является self, в данном случае объект piggy.

# 12. Поясните вызов метода через Fan.about и почему декларация метода about() использует
# зарезервированное слово self.

class Fan
  def self.about
    "my job is to keep people cool"
  end
end

p Fan.about

# Т.к. метод вызывается из класса, то в качестве приемника указывается префикс self

# 13. Что этот код напечатает в STDOUT? Поясните.

class Woman
  SELF = self
end

p Woman::SELF

# Будет напечатано:
# Woman
# т.к. переменной SELF присвоено значение имени класса "Woman"

# 14. Что этот код напечатает в STDOUT? Поясните.

class Dude
end

def Dude.motto
  "Cowabunga"
end

p Dude.motto

# Будет напечатано:
# "Cowabunga"
# т.к. вызывается метод #motto, объявленный не в теле класса,
# но с использованием перед именем метода приемника Dude.

# 15. Что этот код напечатает в STDOUT? Поясните.

class Phone
  def Phone.job
    "Distract you from life"
  end
end

p Phone.job

# Будет напечатано:
# "Distract you from life"
# т.к. вызывается метод #job, объявленный с использованием
# перед именем метода приемника Phone.

# 16. Что этот код напечатает в STDOUT? Поясните.

def blah
  "blah blah"
end

class Geek
  def make_some_voice
    "I am #{blah}"
  end
end

p Geek.new.make_some_voice

# Будет напечатано:
# "I am blah blah"
# т.к. вызывается метод #blah, объявленный в рамках класса .Class и поэтому
# доступный для всех классов и объектов

# 17. Укажите кто тут объект, кто сообщение, что метод и кто получатель сообщения:

x = 5.to_f

# Объект - 5
# Сообщение - x
# Метод - to_f
# Получатель - STDOUT

# 18. Поясните как сообщение (значение) отправляется, кто тут получатель (метод), и
# каково содержание сообщения.
"table".upcase()

# Сообщение - "table"
# Получатель - #upcase
# Содержание - "TABLE"


# 19. Укажите на сообщение (значение) и получателя (метод).

class Calculator
  def add(x, y)
    x + y
  end
end

my_calculator = Calculator.new
my_calculator.send(:add, 3, 4)

# Сообщение - 3, 4
# Получатель - #add

# 20. Укажите на сообщения (значения) и получателя (метод).

3 + 4

# Сообщение - 3, 4
# Получатель - +

# 21. Укажите отправителя, получателя, и само сообщение когда мы дернем метод Circle#area.

class Circle
  def area(radius)
    calc = Calculator.new
    calc.pi * radius ** 2
  end
end

class Calculator
  def pi
    3.14
  end
end

my_circle = Circle.new
p my_circle.area(3)
# Отправитель - my_circle
# Получатель - #area
# Сообщение - 3
