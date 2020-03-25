# keep your descriptions short (less than 40 characters)
require_relative '../lib/board.rb'

RSpec.describe Board do
  describe '#select_slot' do
    board = Board.new
    it 'marks a slot in the board with the player id' do
      board.select_slot(1, 1)
      expect(board.slots[0][0]).to eq(1)
    end

    it 'rejects any numbers outside of this range (1-9)' do
      expect { board.select_slot(1, 0) }.to raise_error(ErrorsModule::NumberOutOfRangeError)
    end

    it 'rejects any slot numbers already selected' do
      expect { board.select_slot(1, 1) }.to raise_error(ErrorsModule::SlotAlreadyPickedError)
    end

    it 'increments the number of slots selected by one' do
      expect { board.select_slot(1, 2) }.to change{board.number_of_slots_selected}.by(1)
    end
  end

  describe '#show_board' do
    board = Board.new
    x = "_____________\n| 1 | 2 | 3 |\n-------------\n| 4 | 5 | 6 |\n-------------\n| 7 | 8 | 9 |\n-------------\n"
    it 'returns the board of the game formatted in its current state' do
      expect(board.show_board).to eq(x)
    end
  end
end
