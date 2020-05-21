#!/usr/bin/env ruby

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/instruction.rb'

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
    current_player = game.current_player
    system 'clear'
    puts board.show_board
    slot_selected = Instruction.ask_user_selection(current_player.player_name)

    begin
      board.select_slot(current_player.player_number, slot_selected)
    rescue StandardError => e
      puts e
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
