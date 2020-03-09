#!/usr/bin/env ruby

class Board
  attr_reader :slots

  def initialize
    @slots = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def select_slot(player_number, slot_number)
    x = (slot_number % 3) - 1
    y = (slot_number.to_f / 3).ceil - 1

    if self.slots[y][x].is_a?(Integer)
      self.slots[y][x] = player_number == 1 ? "X" : "O"      
    end
  end
end

class Player
  attr_reader :player_number
  @@players_count = 0

  def initialize
    @@players_count += 1
    self.player_number = @@players_count
  end

  private

  attr_writer :player_number
end

slots = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

board = Board.new
player1 = Player.new
player2 = Player.new

p board.slots[0], board.slots[1], board.slots[2]

puts "Select a slot:"
p gets.chomp

board.select_slot(1, 1)

p board.slots[0], board.slots[1], board.slots[2]
