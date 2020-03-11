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

  until board.game_finished
    system 'clear'
    puts board.show_board

    begin
      puts "Select a slot #{current_player.player_name}: "
      print '> '

      slot_selected = gets.chomp.to_i
      board.select_slot(slot_selected)
    rescue StandardError => e
      puts e
      retry
    end

    current_player = current_player.player_number == 1 ? player2 : player1
  end

  system 'clear'
  puts board.show_board
  puts 'Game finished'

  if board.winner.nil?
    puts 'Draw'
  else
    puts "The winner is #{board.winner == 1 ? player1.player_name : player2.player_name}!!"
  end
else
  exit
end
