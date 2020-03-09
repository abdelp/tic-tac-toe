#!/usr/bin/env ruby
# frozen_string_literal: true

# Board Class for tic-tac-toe game
class Board
  attr_reader :slots

  def initialize
    @slots = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def select_slot(player_number, slot_number)
    x = (slot_number % 3) - 1
    y = (slot_number.to_f / 3).ceil - 1

    if self.slots[y][x].is_a?(Integer)
        p player_number
        puts player_number == 1
        puts player_number.is_a?(Integer)
        puts player_number.is_a?(String)
      self.slots[y][x] = player_number == 1 ? "X" : "O"
    end
  end
end

class Player
  @@players_count = 0
  attr_reader :player_number

  def initialize
    increment_players
    self.player_number = @@players_count
  end

  def increment_players
    @@players_count += 1
  end

  private

  attr_writer :player_number
end

puts 'Welcome to the TIC TAC TOE game',
     'Main menu',
     'Type exit to quit the game',
     'Type start to play the game'

print '> '
option = gets.chomp

if option == 'play'
  board = Board.new
  player1 = Player.new
  player2 = Player.new

  p board.slots[0], board.slots[1], board.slots[2]

  puts 'Select a slot:'

  p "Player #{player1.player_number}"
  slot_selected = gets.chomp.to_i
  board.select_slot(player1.player_number, slot_selected)
  p board.slots[0], board.slots[1], board.slots[2]
  p 'Now, your move is displayed on the board'

  p "Player #{player2.player_number}"
  slot_selected = gets.chomp.to_i
  board.select_slot(player2.player_number, slot_selected)
  p board.slots[0], board.slots[1], board.slots[2]
  p 'Now, your move is displayed on the board'
else
  exit
end
