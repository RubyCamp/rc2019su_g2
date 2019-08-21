require_relative 'enemy'
require_relative 'player'
require_relative 'shittin'
require_relative 'display'

module Game
  class Director
    def initialize
      @bg_img = Image.load("scenes/game/image/backscreen_loop.png")
      suzuki_img = Image.load("scenes/game/image/suzuki.png")
      @suzuki = Shittin.new(300, 300, suzuki_img)
      morogeebi_img = Image.load("scenes/game/image/ebi.png")
      @morogeebi = Shittin.new(200, 450, morogeebi_img)
      unagi_img = Image.load("scenes/game/image/unagi.png")
      @unagi = Shittin.new(300, 400, unagi_img)
      amasagi_img = Image.load("scenes/game/image/wakasagi.png")
      @amasagi = Shittin.new(500, 300, amasagi_img)
      shizimi_img = Image.load("scenes/game/image/shizimi.png")
      @shizimi = Shittin.new(300, 500, shizimi_img)
      koi_img = Image.load("scenes/game/image/koi.png")
      @koi = Shittin.new(100, 300, koi_img)
      sirauo_img = Image.load("scenes/game/image/shirauo.png")
      @sirauo = Shittin.new(300, 100, sirauo_img)
      @shittin = [@suzuki, @morogeebi, @unagi, @amasagi, @shizimi, @koi, @sirauo]
      @hit_count = 0

      enemy_img = Image.load('scenes/game/image/kuribo1.png')
      @enemys = []
      3.times do
        @enemys << Enemy.new(rand(300)+150,rand(300)+150, enemy_img)
      end
      player_img = Image.load('scenes/game/ghost.png')
      @player = Player.new(100, 100, player_img)

      @player.collision = [20,20,20]
      @enemys.each{|enemy| enemy.collision = [0,0,20]}

      @timer_img = Image.new(600, 20, [0, 0, 255])
      @time = 200
    end

    def play
      Scene.move_to(:gameover) if @time >= 800
      Scene.move_to(:ending) if !(@player.check(@enemys).empty?)


      if @hit_count <= 7
        @shittin[@hit_count<=6 ? @hit_count : 6].draw
      end
      if !(@shittin[@hit_count<=6 ? @hit_count : 6].check(@player).empty?)
        @hit_count += 1
      end

      display(@hit_count)
      Scene.move_to(:ending) if (@hit_count >= 6 && Input.key_push?(K_SPACE))

      @enemys.each{|enemy| enemy.move}
      @enemys.each{|enemy| enemy.draw}
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
