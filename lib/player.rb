# Class for players
class Player
  attr_reader :player_number, :player_name, :score

  def initialize(player_number, player_name, *score)
    self.player_number = player_number
  end

  private

  attr_writer :player_number, :player_name, :score
end