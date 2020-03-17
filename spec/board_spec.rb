require_relative '../lib/board.rb'

RSpec.describe Board do
  describe '#select_slot' do
    board = Board.new

    it 'is expected to select a slot in the board with a player id' do
      board.select_slot(1, 1)
      expect(board.slots[0][0]).to eq(1)
    end
  end

  describe '#show_board' do
    board = Board.new
    x = "_____________\n| 1 | 2 | 3 |\n-------------\n| 4 | 5 | 6 |\n-------------\n| 7 | 8 | 9 |\n-------------\n"
    it 'is expected to show the board of the game in its current state' do
      expect(board.show_board).to eq(x)
    end
  end
end