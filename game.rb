# frozen_string_literal: true

class Game
  RATE = 10

  def initialize
    @bank = 0
  end

  def meeting
    puts "Представьтесь, пожалуйста"
    @player = Player.new(gets.chomp)
    @dealer = Dealer.new('Катала')
    puts "#{@player.name}, #{@dealer.name} приветствует Вас в казино 'Домой без штанов'!"
  end

  def run
    puts "На Вашем счету пока что #{@player.cash} уже почти моих денежных единиц."
    puts "Ставка #{RATE} единиц. Делаете ставку? ( 1 - Да)"
    start = gets.chomp.to_i
    agreement if start == 1
    negation if start != 1
  end

  def agreement
    deck = Deck.new
    @player.cash -= RATE
    @dealer.cash -= RATE
    @bank = RATE * 2
    start
  end

  def negation
    puts "Мы еще втретимся, жадина..."
    self.run
  end
  
  def start
    @player.first_deal
    @player.status
    @dealer.first_deal
    @dealer.first_status
    player_display
    player_act
  end

  def status_display
    @player.status
    @dealer.status
  end

  def player_display
    puts "#{@player.name}, доступные для выбора варинаты:"
    puts "1 - пропустить; 2 - добавить карту; 3 - вскрыть"
  end

  def player_act
    select = gets.chomp.to_i
    case select
    when 1
      dealer_act
    when 2
      @player.deal
      @player.sum_scores
      dealer_win if @player.scores > 21
      dealer_act
    when 3
      winner
    end
  end

  def dealer_act
    @dealer.deal if @player.scores > @dealer.scores && @dealer.scores < 17
    player_win if @dealer.scores > 21
    winner
  end

  def winner
    @player.sum_scores
    @dealer.sum_scores
    if @player.scores == @dealer.scores
      @player.cash += RATE
      @dealer.cash += RATE
      finish
    else
      player_win if @player.scores > @dealer.scores
      dealer_win if @player.scores < @dealer.scores
    end
  end

  def player_win
    status_display
    puts "#{@player.name} выиграл!!!"
    @player.cash += @bank
    finish
    if @dealer.cash != 0
      run
    else
      puts "#{@player.name}, хотите проиграть еще немного денег?))) 1- Да"
      flag = gets.chomp.to_i
      if flag == 1
        meeting
      else
        return
      end
    end
  end

  def dealer_win
    status_display
    puts "Катала выиграл!!!"
    @dealer.cash += @bank
    finish
    if @player.cash != 0
      run
    else
      puts "#{@player.name}, хотите проиграть еще немного денег?))) 1- Да"
      flag = gets.chomp.to_i
      if flag == 1
        meeting
      else
        return
      end
    end
  end

  def finish
    @bank = 0
    @player.cards = []
    @player.scores = 0
    @dealer.cards = []
    @dealer.scores = 0
  end

end