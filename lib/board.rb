# Board Class for tic-tac-toe game
class Board
  attr_accessor :player_turn
  attr_reader :slots

  def initialize
    @slots = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    @number_of_slots_selected = 0
    self.player_turn = 1
  end

  def select_slot(slot_number)
    x, y = get_coordinates(slot_number)
    slots[y][x] = self.player_turn
    switch_player_turn
  end

  def get_coordinates(slot_number)
    x = (slot_number % 3) - 1
    y = (slot_number.to_f / 3).ceil - 1
    [x, y]
  end

  def show_board
    map_symbols = Proc.new do |v, i|
      p "v: #{v}"
      p "i: #{i}"

      if !i.nil?
        if v == 0
          i + 1
        elsif v % 2
          "O"
        else
          "X"
        end
      end
    end

    self.slots.each_with_index do |row, idx|
      p self.slots[0].map.with_index(&map_symbols)
    end
  
    # p self.slots[0].map.with_index(&map_symbols), self.slots[1].map.with_index(&map_symbols), self.slots[2].map.with_index(&map_symbols)
  end

  private

  def switch_player_turn
    self.player_turn = self.player_turn == 1 ? 2 : 1
  end

  attr_accessor :number_of_slots_selected
end