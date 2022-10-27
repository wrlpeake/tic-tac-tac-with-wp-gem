# frozen_string_literal: true

require 'tic_tac_toe_wp'
require_relative '../lib/user_interface'

class GameController
  def initialize
    @default_marker_x = 'X'
    @default_marker_o = 'O'
    @user_interface = UserInterface.new
    @game_logic = TicTacToeWP::GameLogic.new(@default_marker_x, @default_marker_o)
    @player_one = @game_logic.create_player(@default_marker_x)
    @player_two = @game_logic.create_player(@default_marker_o)
  end

  def display_start_game_text
    @user_interface.display_instructions(@player_one.marker, @player_two.marker)
    @user_interface.display_game_board(@game_logic.get_game_board)
  end

  def get_game_type_selection
    @user_interface.request_game_type
  end

  def get_game_type
    game_selection = get_game_type_selection.to_i
    if @game_logic.validate_game_type_selection(game_selection).zero?
      @user_interface.display_game_type_error_message
      get_game_type
    else
      @user_interface.display_validate_game_type_selection(game_selection)
      game_selection
    end
  end

  def get_human_selection(player)
    @user_interface.request_player_selection(player.marker)
  end

  def make_human_turn(player)
    player_selection = get_human_selection(player).to_i
    case @game_logic.validate_human_player_selection(player_selection)
    when 1
      @user_interface.display_wrong_integer_error_message
      make_human_turn(player)
    when 2
      @user_interface.display_position_not_available_error_message
      make_human_turn(player)
    else
      @game_logic.mark_game_board(player.marker, player_selection)
      @user_interface.display_validated_player_selection(player.marker, player_selection)
      @user_interface.display_game_board(@game_logic.get_game_board)
    end
  end

  def make_computer_turn(player)
    computer_selection = @game_logic.get_first_spot_available
    @user_interface.display_computer_player_selection(player.marker, computer_selection)
    @game_logic.mark_game_board(player.marker, computer_selection)
    @user_interface.display_game_board(@game_logic.get_game_board)
  end

  def get_winner
    @game_logic.is_there_a_winner?
  end

  def get_tie
    @game_logic.get_available_positions == []
  end

  def end_game?(winner, tie)
    if winner == true
      @user_interface.display_winner_message
      true
    elsif tie == true
      @user_interface.display_tie_game_message
      true
    else
      winner
    end
  end

  def human_vs_human_game
    while end_game?(get_winner, get_tie) == false
      make_human_turn(@player_one)
      break if end_game?(get_winner, get_tie) == true

      make_human_turn(@player_two)
    end
  end

  def human_vs_computer_game
    while end_game?(get_winner, get_tie) == false
      make_human_turn(@player_one)
      break if end_game?(get_winner, get_tie) == true

      make_computer_turn(@player_two)
    end
  end

  def computer_vs_human_game
    while end_game?(get_winner, get_tie) == false
      make_computer_turn(@player_one)
      break if end_game?(get_winner, get_tie) == true

      make_human_turn(@player_two)
    end
  end

  def computer_vs_computer_game
    while end_game?(get_winner, get_tie) == false
      make_computer_turn(@player_one)
      break if end_game?(get_winner, get_tie) == true

      make_computer_turn(@player_two)
    end
  end

  def load_game
    @user_interface.display_welcome_message
    player_one_marker = get_player_marker('one')
    player_two_marker = get_player_two_marker(player_one_marker)
    @game_logic = TicTacToeWP::GameLogic.new(player_one_marker, player_two_marker)
    @player_one = @game_logic.create_player(player_one_marker)
    @player_two = @game_logic.create_player(player_two_marker)
    display_start_game_text
    case get_game_type
    when 1
      human_vs_human_game
    when 2
      human_vs_computer_game
    when 3
      computer_vs_human_game
    else
      computer_vs_computer_game
    end
  end

  def get_player_one
    @player_one
  end

  def get_player_two
    @player_two
  end

  def get_marker_selection(player_one_or_two)
    @user_interface.request_player_marker(player_one_or_two)
  end

  def get_player_marker(player_one_or_two)
    marker = get_marker_selection(player_one_or_two)
    if @game_logic.validate_marker?(marker) == false
      @user_interface.display_marker_error_message
      get_player_marker(player_one_or_two)
    else
      @user_interface.display_validated_marker_message(player_one_or_two, marker)
      marker
    end
  end

  def get_player_two_marker(player_one_marker)
    player_two = 'two'
    marker = get_player_marker(player_two)
    if @game_logic.duplicate_marker?(player_one_marker, marker) == true
      @user_interface.display_duplicate_marker_error_message
      get_player_two_marker(player_one_marker)
    else
      marker
    end
  end
end
