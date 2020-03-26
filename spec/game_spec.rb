require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

RSpec.describe Game do
  let(:player1) { Player.new(1, 'a') }
  let(:player2) { Player.new(2, 'b') }
  let(:game) { Game.new(player1, player2) }
  let(:draw_moves) { [1, 2, 3, 4, 6, 5, 7, 9, 8] }
  let(:p1_h_win_moves) { [1, 4, 2, 5, 3] }
  let(:p1_v_win_moves) { [1, 2, 4, 3, 7] }
  let(:p2_h_win_moves) { [1, 4, 2, 5, 3] }
  let(:p2_v_win_moves) { [1, 2, 4, 3, 7] }
  let(:p1_d1_win_moves) { [1, 2, 5, 3, 9] }
  let(:p1_d2_win_moves) { [3, 2, 5, 4, 7] }
  let(:p2_d1_win_moves) { [1, 2, 5, 3, 9] }
  let(:p2_d2_win_moves) { [3, 2, 5, 4, 7] }

  describe '#game_finished?' do
    it 'returns false if board.numbers_of_slots_selected is less than 9 and winner is 0' do
      expect(game.game_finished?).to be false
      expect(game.winner).to be_nil
      expect(game.board.number_of_slots_selected).to be < 9
    end

    it 'returns true if number of slots_selected equals to nine' do
      (1..draw_moves.size).each do |i|
        player = i.even? ? 2 : 1
        game.board.select_slot(player, draw_moves[i - 1])
      end
      expect(game.board.number_of_slots_selected == 9).to be true
      expect(game.game_finished?).to be true
    end

    it 'returns true if winner is not nil' do
      (1..p1_h_win_moves.size).each do |i|
        player = i.even? ? 2 : 1
        game.board.select_slot(player, p1_h_win_moves[i - 1])
      end

      game.check_winner

      expect(game.winner).not_to be_nil
      expect(game.game_finished?).to be true
    end
  end

  describe '#switch_player_turn' do
    it 'changes the player turn' do
      expect { game.switch_player_turn }.to change { game.current_player.player_number }.from(1).to(2)
    end
  end

  describe '#winner' do
    it 'returns 1 if the player #1 wins horizontally' do
      game.reset_game
      (1..p1_h_win_moves.size).each do |i|
        player = i.even? ? 2 : 1
        game.board.select_slot(player, p1_h_win_moves[i - 1])
      end
      game.check_winner

      expect(game.winner).to eq(1)
    end

    it 'returns 1 if the player #1 wins vertically' do
      game.reset_game

      (1..p1_v_win_moves.size).each do |i|
        player = i.even? ? 2 : 1
        game.board.select_slot(player, p1_v_win_moves[i - 1])
      end
      game.check_winner

      expect(game.winner).to eq(1)
    end

    it 'returns 1 if the player #1 wins in diagonal #1' do
      game.reset_game

      (1..p1_d1_win_moves.size).each do |i|
        player = i.even? ? 2 : 1
        game.board.select_slot(player, p1_d1_win_moves[i - 1])
      end
      game.check_winner

      expect(game.winner).to eq(1)
    end

    it 'returns 1 if the player #1 wins in diagonal #2' do
      game.reset_game

      (1..p1_d2_win_moves.size).each do |i|
        player = i.even? ? 2 : 1
        game.board.select_slot(player, p1_d2_win_moves[i - 1])
      end
      game.check_winner

      expect(game.winner).to eq(1)
    end

    it 'returns 2 if the player #2 wins horizontally' do
      game.reset_game
      (1..p2_h_win_moves.size).each do |i|
        player = i.even? ? 2 : 1
        game.board.select_slot(player, p2_h_win_moves[i - 1])
      end
      game.check_winner

      expect(game.winner).to eq(1)
    end

    it 'returns 2 if the player #2 wins vertically' do
      game.reset_game

      (1..p2_v_win_moves.size).each do |i|
        player = i.even? ? 2 : 1
        game.board.select_slot(player, p2_v_win_moves[i - 1])
      end
      game.check_winner

      expect(game.winner).to eq(1)
    end

    it 'returns 2 if the player #2 wins in diagonal #1' do
      game.reset_game

      (1..p2_d1_win_moves.size).each do |i|
        player = i.even? ? 2 : 1
        game.board.select_slot(player, p2_d1_win_moves[i - 1])
      end
      game.check_winner

      expect(game.winner).to eq(1)
    end

    it 'returns 2 if the player #2 wins in diagonal #2' do
      game.reset_game

      (1..p2_d2_win_moves.size).each do |i|
        player = i.even? ? 2 : 1
        game.board.select_slot(player, p2_d2_win_moves[i - 1])
      end
      game.check_winner

      expect(game.winner).to eq(1)
    end

    it 'returns nil when game is finished and there\'s no winner (draw)' do
      game.reset_game

      (1..draw_moves.size).each do |i|
        player = i.even? ? 2 : 1
        game.board.select_slot(player, draw_moves[i - 1])
      end
      game.check_winner
      expect(game.winner).to be_nil
    end
  end
end
