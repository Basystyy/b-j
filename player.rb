# frozen_string_literal: true

class Player
  include Deal
  attr_reader :cards, :scores, player_cash
  attr_reader :history

  def initialize(name)
    @name = name
    @cash = 100
    @history = []
    @cards = []
    @scores = 0
  end

end