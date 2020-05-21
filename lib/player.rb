# Class for players
class Player
  attr_reader :player_number, :player_name, :score

  @@player_number = 0

  def initialize(player_name)
    self.player_number = @@player_number += 1
    self.player_name = player_name
  end

  private

  attr_writer :player_number, :player_name, :score
end
