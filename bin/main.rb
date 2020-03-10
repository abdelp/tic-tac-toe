#!/usr/bin/env ruby

require "./lib/board.rb"
require "./lib/player.rb"

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

  # while the game doesn't end

  while slots_selected < 9

    # Request to the user to select a slot
  
    p "Player #{current_player.player_number}"
    slot_selected = gets.chomp.to_i
    board.select_slot(slot_selected)
    p board.slots[0], board.slots[1], board.slots[2]
    p 'Now, your move is displayed on the board'

    slots_selected += 1
    current_player = current_player.player_number == 1 ? player2 : player1
  end

  p 'Game finished'
else
  exit
end
