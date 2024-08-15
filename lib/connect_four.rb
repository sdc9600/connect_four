# ConnectFour board has 6 columns and 7 rows.

class ConnectFour

  attr_accessor :gameboard, :player_turn, :last_token

  def initialize
    @gameboard = Array.new(6) {Array.new(7, 0)}
    @player_turn = 1
    @last_token = [0,0]
  end

  def game_loop
    display_gameboard
  end

  def check_victory?
  end

  def place_token(column)
    first_empty_space = @gameboard[column - 1].index(0)
    @player_turn == 1 ? @gameboard[column - 1][first_empty_space] = 1 : @gameboard[column - 1][first_empty_space] = 2
  end

  def display_gameboard
    puts "#{@gameboard[0]}\n#{gameboard[1]}\n#{@gameboard[2]}\n#{gameboard[3]}\n#{@gameboard[4]}\n#{gameboard[5]}"
  end
  
  def change_turn
    @player_turn == 1 ? @player_turn = 0 : @player_turn = 1
  end

  def validate_token_placement(column)
    if (1..7).include?(column) && @gameboard[column - 1].last == 0
      column
    else
      nil
    end
  end
end

test_game = ConnectFour.new
test_game.game_loop