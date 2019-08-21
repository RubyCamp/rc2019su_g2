require_relative 'teki'
require_relative 'player'
require_relative 'shittin'

module Game
  class Director
    def initialize
      @bg_img = Image.load("scenes/game/image/backscreen_loop.png")
      @suzuki = Shittin.new(300, 300, "scenes/game/image/suzuki.png",1)
      @morogeebi = Shittin.new(1000, 300, "scenes/game/image/ebi.png",0)
      @unagi = Shittin.new(300, 400, "scenes/game/image/unagi.png",0)
      @amasazi = Shittin.new(500, 300, "scenes/game/image/wakasagi.png",0)
      @shizimi = Shittin.new(300, 500, "scenes/game/image/shizimi.png",0)
      @koi = Shittin.new(100, 300, "scenes/game/image/koi.png",0)
      @sirauo = Shittin.new(300, 100, "scenes/game/image/shirauo.png",0)
      enemy_img = Image.load('scenes/game/image/kuribo1.png')
      @teki=Teki.new(450,450, enemy_img)
      player_img = Image.load('scenes/game/ghost.png')
      @player = Player.new(100, 100, player_img)

      @player.collision = [0,0,20]
      @teki.collision = [0,0,20]
      @timer_img = Image.new(600, 20, [0, 0, 255])
      @time = 200
    end

    def play
      Scene.move_to(:gameover) if @time >= 800
      Scene.move_to(:ending) if !(@teki.check(@player).empty?)

  # @@back_x=0
  #    Window.draw(@@back_x, 0, @bg_img)
  #   Window.draw(@@, 0, @bg_img)
  # Window.draw(0, 563, @bg_img)
  # Window.draw(800, 600, @bg_img)
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

      Window.draw(@time, 0, @timer_img)
      @time += 0.4
    end
  end
end
