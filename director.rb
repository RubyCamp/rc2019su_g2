require_relative 'teki'
require_relative 'player'

class Director
  def initialize
 @bg_img = Image.load("image/backscreen_loop.png")
    @suzuki = Shittin.new(300, 300, "image/suzuki.png",1)
  @morogeebi = Shittin.new(1000, 300, "image/ebi.png",0)
@unagi = Shittin.new(300, 400, "image/unagi.png",0)
@amasazi = Shittin.new(500, 300, "image/wakasagi.png",0)
    @shizimi = Shittin.new(300, 500, "image/shizimi.png",0)
    @koi = Shittin.new(100, 300, "image/koi.png",0)
@sirauo = Shittin.new(300, 100, "image/shirauo.png",0)
    @teki=Teki.new(150,150,"image/kuribo1.png")
  @player_image = Image.load('ghost.png')
    @player = Player.new(100, 100, @player_image)
  end

  def play
   Window.draw(0, 0, @bg_img)
  Window.draw(800, 0, @bg_img)
Window.draw(0, 563, @bg_img)
Window.draw(800, 600, @bg_img)
    @suzuki.draw
    @morogeebi.draw
    @unagi.draw
    @amasazi.draw
    @shizimi.draw
    @koi.draw
    @sirauo.draw
    @teki.draw
    @teki.move
    @player.down if Input.key_down?(K_DOWN)
    @player.up if Input.key_down?(K_UP)
    @player.right if Input.key_down?(K_RIGHT)
    @player.left if Input.key_down?(K_LEFT)
    @player.draw
 
 
  end
end