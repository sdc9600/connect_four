# ConnectFour board has 6 columns and 7 rows.

class ConnectFour

  attr_accessor :gameboard, :player_turn

  def initialize
    @gameboard = Array.new(6) {Array.new(7, 0)}
    @player_turn = 1
  end

  def place_token(column)
    if (1..7).include?(column)
      @gameboard[column - 1][0] = 1 if @player_turn == 1
      @gameboard[column - 1][0] = 2 if @player_turn == 0
    else
      nil    
    end
  end
end