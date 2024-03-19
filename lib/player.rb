class Player
  attr_reader :cards
  attr_accessor :bank

  def initialize
    @bank = 100
    @cards = []
  end

  def add_card(card)
    @cards << card if cards.size <= 2
  end

  def show_cards
    cards
  end

  def delete_cards
    @cards = []
  end

  def move; end

  def points # make refactoring
    points = 0
    cards.each do |e|
      if e.include?("K") || e.include?("Q") || e.include?("J") || e.include?("T")
        points += 10
      else
        points += e.chr.to_i
      end
    end
    cards.each do |e|
      if e.include?("A")
        points + 11 > 21 ? points += 1 : points += 11
      end
    end
    points
  end
end