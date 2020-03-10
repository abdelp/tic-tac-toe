#!/usr/bin/env ruby

require './lib/board.rb'
require './lib/player.rb'

puts 'Welcome to the TIC TAC TOE game',
     'Main menu',
     'Type exit to quit the game',
     'Type start to play the game'

print '> '
option = gets.chomp

if option == 'start'
  player1 = nil
  player2 = nil

  (1..2).each do |num|
    puts "Player ##{num} Name: "
    print '> '
    player_name = gets.chomp

    if num == 1
      player1 = Player.new(1, player_name)
    else
      player2 = Player.new(2, player_name)
    end
  end

  board = Board.new

  current_player = player1
  slots_selected = 0

  board.show_board

  until board.game_finished
    begin
      puts "Select a slot #{current_player.player_name}: "
      print '> '

      slot_selected = gets.chomp.to_i
      board.select_slot(slot_selected)
    rescue StandardError => e
      puts e
      retry
    end

    board.show_board

    slots_selected += 1
    current_player = current_player.player_number == 1 ? player2 : player1
  end

  puts 'Game finished'
  puts "The winner is #{board.winner == 1 ? player1.player_name : player2.player_name}!!"
else
  exit
end
