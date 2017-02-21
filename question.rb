# Вопрос по обращению к экземплярам класса
# Создадим класс Dog
class Dog
  def talk
    puts "Bark"
  end
end
# Создадим явно экземпляр класса с именем rex
rex = Dog.new # => #<Dog:0x32a6c18> Экземпляр успешно создан
#d Вызовем метод #talk
rex.talk # "Bark"
# А теперь создадим экземпляр класса с именем, введенным пользователем с консоли
# Например, lucy
input = "lucy"
instance_eval "#{input} = Dog.new"  # => #<Dog:0x3143e08> Экземпляр успешно создан
# но при вызове этого экземпляра получаем ошибку
lucy.talk # NameError: undefined local variable or method `lucy' for main:Object
# Вопрос, как обратиться к экземпляру "lucy"?