#!/usr/bin/env ruby

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

def introduction
  puts 'Welcome to the TIC TAC TOE game',
       'Main menu',
       'Type exit to quit the game',
       'Type start to play the game'

  print '> '
  gets.chomp.downcase
end

option = introduction

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

  game = Game.new(player1, player2)
  board = game.board

  until game.game_finished?
    current_player = game.current_player
    system 'clear'
    puts board.show_board

    begin
      puts "Select a slot #{current_player.player_name}: "
      print '> '

      slot_selected = gets.chomp.to_i
      board.select_slot(current_player.player_number, slot_selected)
      game.check_winner
      game.switch_player_turn
    rescue StandardError => e
      puts e
      retry
    end
  end

  system 'clear'
  puts board.show_board
  puts 'Game finished'

  if game.winner.nil?
    puts 'Draw'
  else
    puts "The winner is #{game.winner == 1 ? game.player1.player_name : game.player2.player_name}!!"
  end
else
  exit
end
