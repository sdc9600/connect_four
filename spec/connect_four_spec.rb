require_relative '../lib/connect_four.rb'

describe ConnectFour do
  subject(:game) { described_class.new }

  describe '#initialize' do 
    # As this is currently just instance variables being created this shouldn't need to be tested.
  end

  describe '#place_token' do
    context 'column given is in the range of 1- 7' do
      it 'places a token in the 4th column when user input is 4.' do
        expect {game.place_token(4) }.to change { game.gameboard[3][0]}.to(1)
      end

      it 'places a token in the 5th column for the computer player' do
        game.player_turn = 0
        expect { game.place_token(5) }.to change { game.gameboard[4][0] }.to(2)
      end
    end

    context 'column given is outside of the range 1 - 7' do

    it 'returns nil when column given is 10' do
      expect(game.place_token(10)).to be_nil
    end

    it 'returns nil when column given is -5' do
      expect(game.place_token(-5)).to be_nil
    end

    it 'returns nil when column given is the letter z' do
    expect(game.place_token('d')).to be_nil
    end

    it 'returns nil when column given is the symbol $' do
      expect(game.place_token('$')).to be_nil
    end
  end
end
end