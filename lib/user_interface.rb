# frozen_string_literal: true

class UserInterface
  def display_welcome_message
    puts "Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n\n"
  end

  def display_instructions
    puts "This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" \
         "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" \
         "Choose numbers 1-9 to select your spot on the board\n\n"
  end

  def display_game_board(game_board)
    horizontal_board_line = '---------'
    game_board.each_index do |i|
      if (i % 3).zero?
        print game_board[i]
      elsif (i % 3) == 1
        print " | #{game_board[i]} | "
      else
        puts "#{game_board[i]}\n#{horizontal_board_line}"
      end
    end
  end

  def display_computer_player_selection(player, first_spot)
    puts "\nComputer Player #{player}, has selected: #{first_spot}\n\n"
  end

  def request_player_selection(player)
    puts "\nPlayer #{player}, please choose an integer between 1 and 9.\n"
    gets
  end

  def request_game_type
    puts "\nPlease choose which of the following types of game you would like to play:\n"
    puts "\nOption 1: Human vs Human\n"
    puts "\nOption 2: Human vs Computer\n"
    puts "\nOption 3: Computer vs Human\n"
    puts "\nOption 4: Computer vs Computer\n"
    gets
  end

  def display_wrong_integer_error_message
    puts "\nError: not an integer between 1 and 9. Please choose again.\n"
  end

  def display_position_not_available_error_message
    puts "\nError: already selected. Please choose again.\n"
  end

  def display_validated_player_selection(player, position)
    puts "\nPlayer #{player}, has selected: #{position}\n\n"
  end

  def display_winner_message
    puts "\nWinner! The game will now end. Thanks for playing.\n\n"
  end

  def display_tie_game_message
    puts "\nTie Game. The game will now end. Thanks for playing.\n\n"
  end

  def display_game_type_error_message
    puts "\nError: not an integer between 1 and 4. Please choose again.\n"
  end

  def display_validate_game_type_selection(option)
    puts "\nYou have selected Option #{option}\n\n"
  end
end
