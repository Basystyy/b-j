# frozen_string_literal: true
class Deck

  attr_reader :card_score
  attr_accessor :play_deck

  @@play_deck = []
  @@card_score = {'A' => 11, 'K' => 10, 'Q' => 10, 'J' => 10, '10' => 10, '9' => 9, '8' => 8,
  '7' => 7, '6' => 6, '5' => 5, '4' => 4, '3' => 3, '2' => 2}

  def initialize
    @cards = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
    @suits = ['♠', '♣', '♦', '♥']
    @deck = []
  end
    
  def self.play_deck
    @@play_deck
  end

  def self.card_score
    @@card_score
  end

  def shuffle_cards
    @cards.each do |card|
      @suits.each do |suit|
        @deck << (card + suit)
      end
    end
    @@play_deck = @deck.shuffle
  end

end