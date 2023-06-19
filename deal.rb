# frozen_string_literal: true

module Deal
  def deal
    card = deck.play_deck[0]
    score = 1 if card[0] == 'A' && if @scores > 11
    score = deck.card_score[card[0]]
    @scores += score
    @cards << card
    deck.play_deck -= card
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