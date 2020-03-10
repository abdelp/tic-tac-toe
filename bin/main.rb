#!/usr/bin/env ruby

# Board Class for tic-tac-toe game
class Board
  attr_reader :slots

  def initialize
    @slots = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def select_slot(player_number, slot_number)
    x, y = get_coordinates(slot_number)
    slots[y][x] = player_number == 1 ? 'X' : 'O' if slots[y][x].is_a?(Integer)
  end

  def get_coordinates(slot_number)
    x = (slot_number % 3) - 1
    y = (slot_number.to_f / 3).ceil - 1
    [x, y]
  end
end

# Class for players
class Player
  attr_reader :player_number

  def initialize(player_number)
    self.player_number = player_number
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
  player1 = Player.new(1)
  player2 = Player.new(2)
  current_player = player1
  slots_selected = 0

  p board.slots[0], board.slots[1], board.slots[2]

  puts 'Select a slot:'

  while slots_selected < 9
    p "Player #{current_player.player_number}"
    slot_selected = gets.chomp.to_i
    board.select_slot(current_player.player_number, slot_selected)
    p board.slots[0], board.slots[1], board.slots[2]
    p 'Now, your move is displayed on the board'

    slots_selected += 1
    current_player = current_player.player_number == 1 ? player2 : player1
  end

  p 'Game finished'
else
  exit
end
