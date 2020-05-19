class Instruction
  def self.start_game
    puts 'Welcome to the TIC TAC TOE game
Main menu
Type exit to quit the game
Do you want to start the game? (y/n): '

    gets.chomp.downcase
  end

  def self.ask_username(num)
    print "Player ##{num} Name:\n> "
    begin
      player_name = gets.chomp.downcase
      raise StandardError, "Name can\'t be blank\n> " if player_name.strip.empty?
    rescue StandardError => e
      print e
      retry
    end
    player_name
  end

  def self.ask_user_selection(player_name)
    print "Select a slot #{player_name}:\n> "
    gets.chomp.to_i
  end

  def self.winner_announcement(game)
    puts 'Game finished'
    if game.winner.nil?
      puts 'Draw'
    else
      puts "The winner is #{game.winner == 1 ? game.player1.player_name : game.player2.player_name}!!"
    end
  end
end
