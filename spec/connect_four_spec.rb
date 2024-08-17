require_relative '../lib/connect_four.rb'

describe ConnectFour do
  subject(:game) { described_class.new }

  describe '#initialize' do 
    # As this is currently just instance variables being created this shouldn't need to be tested.
  end

  describe '#display_gameboard' do
  # Puts / prints the gameboard to the screen, shouldn't need to be tested.
  end

  describe '#place_token' do
    context 'When a token is placed on the board' do
      it 'Places a token for the player when it is the players turn' do
        game.player_turn = 1
        expect { game.place_token(1) }.to change { game.gameboard[0][0]}.to(1)
      end
      it 'Places a token for the computer when it is the computers turn' do
        game.player_turn = 0
        expect { game.place_token(1) }.to change { game.gameboard[0][0]}.to(2)
      end
    end
  end

  describe '#validate_token_placement' do
    context 'column given is inside of the range 1-7' do
      it 'returns 5 when column given is 5' do
        expect(game.validate_token_placement(5)).to be(5)
      end
    end
    context 'column given is outside of the range 1 - 7' do

    it 'returns nil when column given is 10' do
      expect(game.validate_token_placement(10)).to be_nil
    end

    it 'returns nil when column given is -5' do
      expect(game.validate_token_placement(-5)).to be_nil
    end

    it 'returns nil when column given is the letter d' do
    expect(game.validate_token_placement('d')).to be_nil
    end

    it 'returns nil when column given is the symbol $' do
      expect(game.validate_token_placement('$')).to be_nil
    end
  end

  context 'column given is within the range 1-7 but that column is full' do
    it 'returns nil when 5th column is full' do
      game.gameboard[4][6] = 1
      expect(game.validate_token_placement(5)).to be_nil
    end
  end
end

  describe '#change_turn' do
    context 'function that changes the turn state of the game' do
      it 'Changes the turn to player_turn when it is compuers turn' do
        game.player_turn = 0
        expect {game.change_turn }.to change {game.player_turn}.to(1)
      end

      it 'Changes the turn to be computer_turn when it is players turn' do
        game.player_turn = 1
        expect { game.change_turn }.to change { game.player_turn}.to(0)
      end
    end
  end
  describe '#check_victory?' do
    context 'After player / computer turn, check if current player igame.s victorious' do
      it 'Returns true when player has made four in a row vertically' do
        game.last_token = [0,4]
        game.gameboard[0] = [1, 1, 1, 1, 0, 0, 0]
        expect(game.check_victory?).to be true
      end
      it 'Returns true when player has made four in a row horizontally' do
        game.last_token = [3,0]
        game.gameboard[2][0] = 1
        game.gameboard[3][0] = 1
        game.gameboard[4][0] = 1
        game.gameboard[5][0] = 1
        expect(game.check_victory?).to be true
      end
      it 'Returns true when player has made four in a row diagonally' do
        game.last_token = [3,3]
        game.gameboard[0][0] = 1
        game.gameboard[1][1] = 1
        game.gameboard[2][2] = 1
        game.gameboard[3][3] = 1
        expect(game.check_victory?).to be true
      end
    end
  end
end