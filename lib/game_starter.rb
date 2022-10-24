# frozen_string_literal: true

require_relative '../lib/game_controller'

class GameStarter
  def initialize(player_one_marker, player_two_marker)
    @game_controller = GameController.new(player_one_marker, player_two_marker)
  end

  def start_tic_tac_toe_game
    @game_controller.load_game
  end
end

NEW_GAME = GameStarter.new
NEW_GAME.start_tic_tac_toe_game
