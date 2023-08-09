# frozen_string_literal: true

class Dealer < Player
  attr_reader :name
  attr_accessor :cash, :cards, :scores

  def first_status
    puts 'Катала - Карты: * *; Очки: *'
  end
end
