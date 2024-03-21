class User < Player
  attr_accessor :name

  def enter_user_name
    puts 'Введите Ваше имя:'
    @name = gets.chomp.to_s
  end
end
