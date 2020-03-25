require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

RSpec.describe Game do
  describe '#game_finished' do
    it 'returns false if board.numbers_of_slots_selected is less than 9 and winner is 0' do
        player1 = Player.new(1, 'a')
        player2 = Player.new(2, 'b')
        game = Game.new(player1, player2)

        expect(game.game_finished).to be false
        expect(game.winner).to be_nil
        expect(game.board.number_of_slots_selected).to be < 9
    end
  end    
end