# frozen_string_literal: true
class Deck

  
  CARD_SCORE = {'A' => 11, 'K' => 10, 'Q' => 10, 'J' => 10, '10' => 10, '9' => 9, '8' => 8,
  '7' => 7, '6' => 6, '5' => 5, '4' => 4, '3' => 3, '2' => 2}
  SUITS = ['♠', '♣', '♦', '♥']

  attr_accessor :play_deck

  @@play_deck = []

  def initialize
    @deck = []
    CARD_SCORE.keys.each do |card|
      SUITS.each do |suit|
        @deck << (card + suit)
      end
    end
    @@play_deck = @deck.shuffle
  end
    
  def self.play_deck
    @@play_deck
  end

end