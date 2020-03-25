require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

RSpec.describe Game do
  describe '#game_finished?' do
    player1 = Player.new(1, 'a')
    player2 = Player.new(2, 'b')
    game = Game.new(player1, player2)
    draw_moves = [1, 2, 3, 4, 6, 5, 7, 9, 8]
    p1_h_win_moves = [1, 4, 2, 5, 3]
    p1_v_win_moves = [1, 2, 4, 3, 7]
    p2_h_win_moves = [1, 4, 2, 5, 3]
    p2_v_win_moves = [1, 2, 4, 3, 7]
    p1_d1_win_moves = [1, 2, 5, 3, 9]
    p1_d2_win_moves = [3, 2, 5, 4, 7]
    p2_d1_win_moves = [1, 2, 5, 3, 9]
    p2_d2_win_moves = [3, 2, 5, 4, 7]

    it 'returns false if board.numbers_of_slots_selected is less than 9 and winner is 0' do
      expect(game.game_finished?).to be false
      expect(game.winner).to be_nil
      expect(game.board.number_of_slots_selected).to be < 9
    end

    it 'returns true if number of slots_selected equals to nine' do
      for i in 1..9
        player = i % 2 == 0 ? 2 : 1
        game.board.select_slot(player, draw_moves[i - 1])
      end
      expect(game.board.number_of_slots_selected == 9).to be true
      expect(game.game_finished?).to be true
    end

    it 'returns true if the player #1 wins' do

    end
  end 
end