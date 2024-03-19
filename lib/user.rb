class User < Player
  attr_accessor :name

  def initialize
    super
  end

  def enter_user_name
    puts 'Введите Ваше имя:'
    @name = gets.chomp.to_s
  end

  def move
    puts '1. Добавить карту'
    puts '2. Открыть карты'
    puts '3. Пас'
    guess = gets.chomp.to_i
  end
end
