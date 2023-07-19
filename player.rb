# frozen_string_literal: true
require_relative './deck'

class Player

  CARD_SCORE = {'A' => 11, 'K' => 10, 'Q' => 10, 'J' => 10, '10' => 10, '9' => 9, '8' => 8,
  '7' => 7, '6' => 6, '5' => 5, '4' => 4, '3' => 3, '2' => 2}
  
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

  def sum_scores
    @scores = 0
    @cards.each do |card|
      card = card.sub(card[-1], '')
      if card == 'A' && @scores > 11
        score = 1
      else
        score = CARD_SCORE[card].to_i
      end
      @scores += score
    end
  end

  def print_scores
    sum_scores
    puts "Очки: #{self.scores}"
  end

  def status
    sum_scores
    print_cards
    print_scores
  end

end