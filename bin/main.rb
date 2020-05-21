#!/usr/bin/env ruby

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/instruction.rb'

system 'clear'
option = Instruction.start_game

if option == 'y'
  players = []

  (1..2).each do |num|
    player_name = Instruction.ask_username(num)
    players << Player.new(player_name)
  end

  game = Game.new(*players)
  board = game.board

  until game.game_finished?
    err_msg = nil
    current_player = game.current_player

    begin
      system 'clear'
      puts board.show_board
      puts err_msg if err_msg 
      slot_selected = Instruction.ask_user_selection(current_player.player_name)
      board.select_slot(current_player.player_number, slot_selected)
    rescue StandardError => e
      err_msg = e
      retry
    end

    game.check_winner
    game.switch_player_turn
  end

  system 'clear'
  puts board.show_board
  Instruction.winner_announcement(game)
else
  exit
end
