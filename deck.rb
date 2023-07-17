# frozen_string_literal: true
class Deck

  CARDS = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
  SUITS = ['♠', '♣', '♦', '♥']

  attr_reader :card_score
  attr_accessor :play_deck

  @@play_deck = []

  def initialize
    @deck = []
    CARDS.each do |card|
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