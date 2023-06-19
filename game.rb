# frozen_string_literal: true

class Game
  def initialize
    @bank = 0
  end

  def meeting
    puts "Представьтесь, пожалуйста"
    player = Player.new(gets.chomp)
    dealer = Dealer.new('Катала')
    puts "#{player.name}, #{dealer.name} приветствует Вас в казино 'Домой без штанов'!"
  end

  def run
    puts "На Вашем счету пока что #{player.player_cash} уже почти моих денежных единиц."
    puts "Ставка 5 единиц. Делаете ставку? ( 1 - Да)"
    start = gets.chomp
    agreement if start == 1
    negation if start != 1
  end

  def agreement
    deck = Deck.new
    @player_cash -= 5
    @dealer_cash -= 5
    @bank = 10
    player_act
  end

  def negation
    puts "Мы еще втретимся, жадина..."
    self.run
  end

  def first_deal
    2.times do
      self.deal
    end
  end
  
  def player_act
    first_deal
    status
    puts "Еще карту?"
    choice = gets.chomp
    
  end

end