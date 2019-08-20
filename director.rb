class Director
  def initialize
    @player_image = Image.load('ghost.png')
    @player = Player.new(100, 100, @player_image)
  end
  def play
    @player.down if Input.key_down?(K_DOWN)
    @player.up if Input.key_down?(K_UP)
    @player.right if Input.key_down?(K_RIGHT)
    @player.left if Input.key_down?(K_LEFT)
    @player.draw

  end  
end
