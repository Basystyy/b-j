# frozen_string_literal: true


class Player
  attr_reader :name
  attr_accessor :history, :cash, :cards, :scores

  def initialize(name)
    @name = name
    @cash = 100
    @history = []
    @cards = []
    @scores = 0
  end

  def deal
    card = Deck.play_deck[0]
    if card[0] == 'A' && @scores >= 11
      score = 1
    else
      if card[0] == '1'
        score = 10
      else
        score = Deck.card_score[card[0]].to_i
      end
    end
    @scores += score
    @cards << card
    Deck.play_deck.delete(card)
  end

  def print_cards
    print "#{self.name} - Карты: "
    self.cards.each do |card|
      print "#{card} "
    end
  end

  def first_deal
    2.times do
      self.deal
    end
  end

  def print_scores
    puts "Очки: #{self.scores}"
  end

  def status
    print_cards
    print_scores
  end

end