require './lib/error.rb'

# Board Class for tic-tac-toe game
class Board
  include ErrorsModule

  attr_accessor :player_turn
  attr_reader :slots, :game_finished, :winner

  def initialize
    @slots = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    @number_of_slots_selected = 0
    self.player_turn = 1
  end

  def select_slot(slot_number)
    raise NumberOutOfRangeError, 'Error: Please type numbers between 1-9' unless slot_number >= 1 && slot_number <= 9

    x, y = get_coordinates(slot_number)

    unless (slots[y][x]).zero?
      raise SlotAlreadyPickedError, 'Error: Slot already selected, please select an available one'
    end

    slots[y][x] = player_turn
    @number_of_slots_selected += 1
    self.game_finished = true if @number_of_slots_selected == 9
    check_winner(x, y)
    switch_player_turn unless game_finished
  end

  def get_coordinates(slot_number)
    x = (slot_number % 3) - 1
    y = (slot_number.to_f / 3).ceil - 1
    [x, y]
  end

  def show_board
    puts '_____________'
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
      puts "| #{x[0]} | #{x[1]} | #{x[2]} |"
      puts '_____________'
    end
  end

  private

  def switch_player_turn
    @player_turn = @player_turn == 1 ? 2 : 1
  end

  def check_winner(coord_x, coord_y)
    diagonals = (0..2).inject([[], [], [], []]) do |acc, i|
      acc[0].push(slots[i][i])
      acc[1].push(slots[i][2 - i])
      acc[2].push(slots[i][coord_x])
      acc[3].push(slots[coord_y][i])
      acc
    end
    winners = diagonals.filter { |arr| arr.uniq.size == 1 && arr[0] != 0 }[0]
    self.winner = winners[0] unless winners.nil?
    self.game_finished = true unless winner.nil?
  end

  attr_writer :game_finished, :winner
end
