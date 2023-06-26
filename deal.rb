# frozen_string_literal: true

module Deal
  def deal
    card = Deck.play_deck[0]
    score = 1 if card[0] == 'A' && @scores > 11
    score = Deck.card_score[card[0]].to_i
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