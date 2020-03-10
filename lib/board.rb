require './lib/error.rb'

# Board Class for tic-tac-toe game
class Board
  include ErrorsModule

  attr_accessor :player_turn
  attr_reader :slots, :game_finished

  def initialize
    @slots = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    @number_of_slots_selected = 0
    self.player_turn = 1
  end

  def select_slot(slot_number)
    raise NumberOutOfRangeError, 'Error: Please type numbers between 1-9' unless slot_number >= 1 && slot_number <= 9

    x, y = get_coordinates(slot_number)

    raise SlotAlreadyPickedError, 'Error: Slot already selected, please select an available one' unless (slots[y][x]).zero?

    slots[y][x] = player_turn
    check_winner(x, y)
    switch_player_turn unless game_finished
  end

  def get_coordinates(slot_number)
    x = (slot_number % 3) - 1
    y = (slot_number.to_f / 3).ceil - 1
    [x, y]
  end

  def show_board
    slots.each_with_index do |row, idx|
      x = row.map.with_index do |v, i|
        case v
        when 0
          i + 1 + (idx * 3)
        when 1
          'X'
        when 2
          'O'
        end
      end
      p x
    end
  end

  private

  def switch_player_turn
    @player_turn = @player_turn == 1 ? 2 : 1
  end

  def check_winner(coord_x, coord_y)
    winner = slots[coord_y].uniq[0] if slots[coord_y].uniq.size == 1
    winner = slots.transpose[coord_x].uniq[0] if slots.transpose[coord_x].uniq.size == 1
    diagonals = (0..2).inject([[], []]) do |acc, i|
      acc[0].push(slots[i][i])
      acc[1].push(slots[i][2 - i])
      acc
    end
    winner = diagonals[0].uniq[0] if diagonals[0].uniq.size == 1
    winner = diagonals[1].uniq[0] if diagonals[1].uniq.size == 1

    self.game_finished = true if winner != 0 && !winner.nil?
  end

  attr_accessor :number_of_slots_selected
  attr_writer :game_finished
end
