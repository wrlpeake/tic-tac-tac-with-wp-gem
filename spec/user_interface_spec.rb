# frozen_string_literal: true

require_relative '../lib/user_interface'
require 'stringio'

describe UserInterface do
  before(:each) do
    @user_interface = UserInterface.new
  end

  it 'should display a welcome message' do
    expect do
      @user_interface.display_welcome_message
    end.to output("Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n\n").to_stdout
  end

  it 'should display simple instructions explaining how to play' do
    player_one = 'X'
    player_two = 'O'
    expect do
      @user_interface.display_instructions(player_one, player_two)
    end.to output("This is a two-player game. The first player will be the #{player_one} team, the second player will be #{player_two} team.\n\n" \
                  "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" \
                  "Choose numbers 1-9 to select your spot on the board\n\n").to_stdout
  end

  it 'should show the user a 3x3 board with numbers 1-9' do
    game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    expect do
      @user_interface.display_game_board(game_board)
    end.to output("1 | 2 | 3\n" \
                  "---------\n" \
                  "4 | 5 | 6\n" \
                  "---------\n" \
                  "7 | 8 | 9\n" \
                  "---------\n").to_stdout
  end

  it "should confirm the computer player's selection to the command line" do
    player = 'X'
    first_spot = 1
    computer_thinking_message = /\nComputer Player #{player} is thinking...\n\n/
    computer_selected_message = /\nComputer Player #{player}, has selected: #{first_spot}\n\n/
    expect do
      @user_interface.display_computer_player_selection(player, first_spot)
    end.to output(computer_selected_message && computer_thinking_message).to_stdout
  end

  it 'should request and receive an integer between 1-9 from the player' do
    player = 'X'
    random_between_one_and_nine = rand(1..9)
    input_string = random_between_one_and_nine.to_s
    input = StringIO.new(input_string)
    $stdin = input
    $stdout = StringIO.new

    position = @user_interface.request_player_selection(player)

    expect(position).to eql input_string
  end

  it 'should ask the user to select a number between 1-4 for the game type' do
    random_between_one_and_four = rand(1..4)
    input_string = random_between_one_and_four.to_s
    input = StringIO.new(input_string)
    $stdin = input
    $stdout = StringIO.new

    game_type = @user_interface.request_game_type

    expect(game_type).to eql input_string
  end

  it 'should display wrong integer error message' do
    expect do
      @user_interface.display_wrong_integer_error_message
    end.to output("\nError: not an integer between 1 and 9. Please choose again.\n").to_stdout
  end

  it 'should display position is not available error message' do
    expect do
      @user_interface.display_position_not_available_error_message
    end.to output("\nError: already selected. Please choose again.\n").to_stdout
  end

  it 'should display the validated human player selection message' do
    player = 'X'
    position = 2
    expect do
      @user_interface.display_validated_player_selection(player, position)
    end.to output("\nPlayer #{player}, has selected: #{position}\n\n").to_stdout
  end

  it 'should display a winning message' do
    expect do
      @user_interface.display_winner_message
    end.to output("\nWinner! The game will now end. Thanks for playing.\n\n").to_stdout
  end

  it 'should display a tie game message' do
    expect do
      @user_interface.display_tie_game_message
    end.to output("\nTie Game. The game will now end. Thanks for playing.\n\n").to_stdout
  end

  it 'should display a wrong game type error message' do
    expect do
      @user_interface.display_game_type_error_message
    end.to output("\nError: not an integer between 1 and 4. Please choose again.\n").to_stdout
  end

  it 'should display a validated game type message' do
    option = 2
    expect do
      @user_interface.display_validate_game_type_selection(option)
    end.to output("\nYou have selected Option #{option}\n\n").to_stdout
  end

  it 'should request a marker for the players' do
    input_string = '£'
    input = StringIO.new(input_string)
    $stdin = input
    $stdout = StringIO.new

    marker = @user_interface.request_player_marker('one')

    expect(marker).to eql input_string
  end

  it 'should display a error message saying you cannot choose a marker as a number' do
    expect do
      @user_interface.display_marker_error_message
    end.to output("\nError, you cannot choose a number. Please select again\n\n").to_stdout
  end

  it 'should display a validation message confirming the marker' do
    player_one = 'one'
    marker = 'X'
    expect do
      @user_interface.display_validated_marker_message(player_one, marker)
    end.to output("\nPlayer #{player_one} has chosen the marker: #{marker}\n\n").to_stdout
  end

  it 'should display an error message when player two tries to choose the same marker as player one' do
    expect do
      @user_interface.display_duplicate_marker_error_message
    end.to output("\nYou cannot choose the same marker as Player One, please choose again.\n\n").to_stdout
  end
end
