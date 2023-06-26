# frozen_string_literal: true

require_relative './deck'
require_relative './deal'
require_relative './game'
require_relative './player'
require_relative './dealer'

game = Game.new
game.meeting
game.run