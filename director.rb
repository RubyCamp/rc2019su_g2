require_relative 'player'

class Director
  def initialize
    @player_image = Image.load('')
    @player = Player.new(100,100,@player_image)
  end
  def play

  end  
end
