require './lib/error.rb'

# Board Class for tic-tac-toe game
class Board
  include ErrorsModule

  attr_reader :slots, :number_of_slots_selected

  def initialize
    @slots = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    @number_of_slots_selected = 0
  end

  def select_slot(player, slot_number)
    err_msg = 'Error: Please type only numbers between 1-9'
    raise NumberOutOfRangeError, err_msg unless slot_number >= 1 && slot_number <= 9

    x, y = get_coordinates(slot_number)

    unless (slots[y][x]).zero?
      raise SlotAlreadyPickedError, 'Error: Slot already selected, please select an available one'
    end

    slots[y][x] = player
    @number_of_slots_selected += 1
  end

  def show_board
    output = '_' * 13 + "\n"
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
      output += "| #{x[0]} | #{x[1]} | #{x[2]} |\n" + '-' * 13 + "\n"
    end
    output
  end

  private

  def get_coordinates(slot_number)
    x = (slot_number % 3) - 1
    y = (slot_number.to_f / 3).ceil - 1
    [x, y]
  end
end
