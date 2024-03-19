class Deck
  attr_accessor :deck

  def initialize
    @deck = generate_deck
  end

  def cards_shuffle
    @deck.shuffle!
  end

  def take_card
    @deck.pop
  end

  private

  def generate_deck
    deck = [], suits = [], ranks = []
    card = Card.new
    ["\u2660","\u2665","\u2666","\u2663"].each do |element|
      suits << card.suit = element
    end

    '23456789TJQKA'.chars.each do |element|
      ranks << card.rank = element
    end

    deck = ranks.product(suits).map(&:join)
  end
end
