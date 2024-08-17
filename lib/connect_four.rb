class ConnectFour

  attr_accessor :gameboard, :player_turn, :last_token

  def initialize
    @gameboard = Array.new(6) {Array.new(7, 0)}
    @player_turn = 1
    @last_token = [0,0]
  end

  def game_loop
    until check_victory? == true
    p display_gameboard
    column = gets.to_i
    place_token(column) if validate_token_placement(column) != nil
    change_turn
    end
  end

  def build_arrays
    x = 0
    horizontal_check = []
    diagonal_check = []
    diagonal_check2 = []
    array_check = []
    vertical_check = gameboard[last_token[0]]

    until x == 6 do
    horizontal_check.append(gameboard[x][0])
    x += 1
    end
    x = -3
    until x == 3 do
      diagonal_check.append(gameboard[last_token[0] + x][last_token[1] + x]) if last_token[0] + x >= 0 && last_token[1] + x >= 0 && last_token[0] + x <= 5 && last_token[1] + x <= 6
      x += 1
    end
    x = 3
    until x == -3 do
      diagonal_check2.append(gameboard[last_token[0] + x][last_token[1] + x]) if last_token[0] + x >= 0 && last_token[1] + x >= 0 && last_token[0] + x <= 5 && last_token[1] + x <= 6
      x -= 1
    end
    array_check.append(horizontal_check, vertical_check, diagonal_check, diagonal_check2)
    array_check
  end

  def check_victory?(array_check = build_arrays)
    x = 0
    until array_check == []
      return true if array_check[0][x..(x+3)] == [1,1,1,1]
      x += 1
      if x == 3
        array_check.delete_at(0)
        x = 0
      end  
    end
    false
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