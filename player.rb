# frozen_string_literal: true


class Player
  include Deal
  attr_reader :name
  attr_accessor :history, :cash, :cards, :scores

  def initialize(name)
    @name = name
    @cash = 100
    @history = []
    @cards = []
    @scores = 0
  end

end