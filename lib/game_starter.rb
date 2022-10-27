# frozen_string_literal: true

require_relative '../lib/game_controller'
require_relative '../lib/user_interface'

class GameStarter
  def initialize
    @game_controller = GameController.new
  end

  def start_tic_tac_toe_game
    @game_controller.load_game
  end
end

NEW_GAME = GameStarter.new
NEW_GAME.start_tic_tac_toe_game
