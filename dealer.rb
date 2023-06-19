# frozen_string_literal: true

class Dealer
  include Deal
  attr_accessor :cards, :scores, :dealer_cash
  attr_reader :history

  def initialize(name)
    @name = name
    @cash = 100
    @history = []
    @cards = []
    @scores = 0
  end

  def first_status
    puts "Катала - Карты: * *; Очки: *"
  end

end