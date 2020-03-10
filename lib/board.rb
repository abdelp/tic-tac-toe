# Board Class for tic-tac-toe game
class Board
  attr_accessor :player_turn
  attr_reader :slots, :game_finished

  def initialize
    @slots = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    @number_of_slots_selected = 0
    self.player_turn = 1
  end

  def select_slot(slot_number)
    x, y = get_coordinates(slot_number)
    slots[y][x] = player_turn
    check_winner
    switch_player_turn unless game_finished
  end

  def get_coordinates(slot_number)
    x = (slot_number % 3) - 1
    y = (slot_number.to_f / 3).ceil - 1
    [x, y]
  end

  private

  def switch_player_turn
    @player_turn = @player_turn == 1 ? 2 : 1
  end

  def check_winner(coord_x, coord_y)
    winner = slots[coord_y].uniq[0] if slots[coord_y].uniq.size == 1
    winner = slots.transpose[coord_x].uniq[0] if slots.transpose[coord_x].uniq.size == 1

    diagonals = (0..2).each_with_object([[], []]) do |acc, i|
      acc[0].push(slots[i][i])
      acc[1].push(slots[i][2 - i])
      acc
    end

    winner = diagonals[0].uniq[0] if diagonals[0].uniq.size == 1
    winner = diagonals[1].uniq[0] if diagonals[1].uniq.size == 1

    self.game_finished = true if winner != 0
  end

  attr_accessor :number_of_slots_selected
  attr_writer :game_finished
end
