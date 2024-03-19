class Game
  def initialize
    @rounds = 0
  end

  def cls
    system 'clear' or system 'cls'
  end

  def make_bet(user, dealer, bet)
    @money_in_game = bet * 2
    user.bank -= bet 
    dealer.bank -= bet
  end

  def game_message(user, dealer, flag)
    puts "Деньги игрока: #{user.bank} ||| Деньги дилера: #{dealer.bank}"
    puts "Карты игрока: #{user.show_cards}"
    puts "Очки игрока: #{user.points}"
    puts "Карты дилера: #{dealer.show_cards(flag)}"
  end

  def final_message(user, dealer)
    cls
    puts ">>>>>> #{define_winner(user, dealer)} <<<<<<"

    game_message(user, dealer, false)
    puts "Очки дилера #{dealer.points}"
    puts
  end

  def define_winner(user, dealer)
    if dealer.points > 21 && dealer.points != user.points
      user.bank += @money_in_game
      'Победил игрок'
    elsif user.points > 21 && dealer.points != user.points
      dealer.bank += @money_in_game
      'Победил дилер'
    elsif user.points > dealer.points
      user.bank += @money_in_game
      'Победил игрок'
    elsif user.points < dealer.points
      dealer.bank += @money_in_game
      'Победил дилер'
    else
      user.bank += @money_in_game / 2
      dealer.bank += @money_in_game / 2
      'Ничья'
    end
  end

  def play_round(user, dealer)
    cls
    user.delete_cards
    dealer.delete_cards

    deck = Deck.new
    deck.cards_shuffle

    2.times do 
      user.add_card(deck.take_card)
      dealer.add_card(deck.take_card)
    end

    make_bet(user, dealer, 10)

    puts "Игра №#{@rounds += 1}"
    puts "Деньги в игре: #{@money_in_game}"

    game_message(user, dealer, true)
    puts

    case user.move
    when 1
      user.add_card(deck.take_card)
      dealer.move(deck.take_card)
      final_message(user, dealer)
    when 2
      final_message(user, dealer)
    when 3
      dealer.move(deck.take_card)
      final_message(user, dealer)
    end
  end

  def start_game
    user = User.new
    dealer = Dealer.new

    user.enter_user_name
    cls
    puts "#{user.name}, добро пожаловать в игру Black Jack!"
    sleep 3

    play_round(user, dealer)

    loop do
      puts 'Хотите сыграть еще раунд y(yes)/n(no)'
      guess = gets.chomp

      if guess.include?('y') || guess.include?('yes')
        play_round(user, dealer)
      else
        puts 'Конец игры.'
        break
      end
    end
  end
end
