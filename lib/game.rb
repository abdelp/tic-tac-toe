require_relative '../lib/board.rb'

class Game
  attr_reader :board, :current_player, :game_finished, :winner, :player1, :player2

  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1
    @player2 = player2
    self.current_player = @player1
    self.game_finished = false
  end

  def game_finished?
    self.game_finished = true if self.winner || @board.number_of_slots_selected == 9
    game_finished
  end

  def check_winner
    winners = @board.slots.find { |row| row.uniq.size == 1 && row[0] != 0 }
    winners ||= @board.slots.transpose.find { |row| row.uniq.size == 1 && row[0] != 0 }

    diagonals = (0..2).inject([[], []]) do |acc, i|
      acc[0].push(@board.slots[i][i])
      acc[1].push(@board.slots[i][2 - i])
      acc
    end

    winners ||= diagonals.find { |arr| arr.uniq.size == 1 && arr[0] != 0 }

    self.winner = winners[0] unless winners.nil?
    winner
  end

  def switch_player_turn
    self.current_player = current_player.player_number == 1 ? @player2 : @player1
  end

  def reset_game
    self.game_finished = false
    self.winner = nil
    board.clean_board
  end

  private

  attr_writer :game_finished, :current_player, :winner
end
