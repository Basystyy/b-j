# frozen_string_literal: true

class Player
  
  attr_reader :name
  attr_accessor :cash, :cards

  def initialize(name)
    @name = name
    @cash = 100
    @cards = []
  end

  def deal
    @cards << Deck.play_deck.shift
  end

  def print_cards
    print "#{self.name} - Карты: "
    @cards.each do |card|
      print "#{card} "
    end
  end

  def first_deal
    2.times do
      self.deal
    end
  end

  def sort_cards
    aces = []
    play_cards = []
    @cards.each do |card|
      if card[0] == 'A'
        aces <<  card
      else
        play_cards << card
      end
    end
    @cards = play_cards + aces
  end
  
  def sum_scores
    scores = 0
    sort_cards
    @cards.each do |card|
      card = card.sub(card[-1], '')
      if card == 'A' && scores > 11
        score = 1
      else
        score = Deck::CARD_SCORE[card].to_i
      end
      scores += score
    end
    scores
  end

  def print_scores
    sum_scores
    puts "Очки: #{self.sum_scores}"
  end

  def status
    sum_scores
    print_cards
    print_scores
  end

end