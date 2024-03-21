class Player
  attr_reader :cards
  attr_accessor :bank

  INITIAL_BANK = 100

  def initialize
    @bank = INITIAL_BANK
    @cards = []
  end

  def add_card(card)
    @cards << card if cards.size <= 2
  end

  # def show_cards
  #   cards
  # end

  def delete_cards
    @cards = []
  end

  def move
    raise NotImplementedError, 'Метод move должен быть переопределен в подклассе'
  end

  def points
    points = 0
    ace_count = 0
    special_values = %w[K Q J T]

    cards.each do |card|
      value = card[0]
      card_value = if special_values.include?(value)
                     10
                   elsif value == 'A'
                     ace_count += 1
                     11
                   else
                     value.to_i
                   end

      points += card_value
    end

    while points > 21 && ace_count.positive?
      points -= 10
      ace_count -= 1
    end

    points
  end
end
