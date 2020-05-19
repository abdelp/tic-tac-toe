#!/usr/bin/env ruby

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/instruction.rb'

option = Instruction.start_game

if option == 'y'
  player1 = nil
  player2 = nil

  (1..2).each do |num|
    player_name = Instruction.ask_username(num)

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
    puts board.show_board + "\n"
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
  puts board.show_board + "\n"
  Instruction.winner_announcement(game)
else
  exit
end
