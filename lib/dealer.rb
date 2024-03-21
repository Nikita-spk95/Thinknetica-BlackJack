class Dealer < Player
  def show_cards(secret)
    secret == true ? (' * ' * cards.size).split(' ') : cards
  end

  def move(card)
    add_card(card) if points < 17
  end
end
