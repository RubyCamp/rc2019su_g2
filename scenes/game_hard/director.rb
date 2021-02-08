require_relative 'enemy'
require_relative 'normal_enemy'
require_relative 'speed_enemy'
require_relative 'chase_enemy'
require_relative 'player'
require_relative 'shittin'
require_relative 'display'
require_relative 'background'
require_relative 'attack'

module GameHard
  class Director
    NOMAL_ENEMY_NUMBER = 5
    SPEED_ENEMY_NUMBER = 5
    CHASE_ENEMY_NUMBER = 1
    TIMER_SPEED = 0.15

    def initialize
      @bg_img = Image.load("scenes/game_hard/image/backscreen_loop.png")
      @backgrounds = [
          Background.new(Window.width, 0, @bg_img),
          Background.new(0, 0, @bg_img),
          Background.new(Window.width, Window.height, @bg_img),
          Background.new(0, Window.height, @bg_img),
        ]
      @backgrounds.map{|obj| obj.dx = -1 }
      @backgrounds.map{|obj| obj.dy = -1 }

      suzuki_img = Image.load("scenes/game_hard/image/suzuki.png")
      @suzuki = Shittin.new(300, 300, suzuki_img)
      morogeebi_img = Image.load("scenes/game_hard/image/ebi.png")
      @morogeebi = Shittin.new(200, 450, morogeebi_img)
      unagi_img = Image.load("scenes/game_hard/image/unagi.png")
      @unagi = Shittin.new(300, 400, unagi_img)
      amasagi_img = Image.load("scenes/game_hard/image/wakasagi.png")
      @amasagi = Shittin.new(500, 300, amasagi_img)
      shizimi_img = Image.load("scenes/game_hard/image/shizimi.png")
      @shizimi = Shittin.new(300, 500, shizimi_img)
      koi_img = Image.load("scenes/game_hard/image/koi.png")
      @koi = Shittin.new(100, 300, koi_img)
      sirauo_img = Image.load("scenes/game_hard/image/shirauo.png")
      @sirauo = Shittin.new(300, 100, sirauo_img)
      @shittin = [@suzuki, @morogeebi, @unagi, @amasagi, @shizimi, @koi, @sirauo]
      @shittin.each_with_index do |shittin, i|
        shittin.collision_enable = false
      end
      @hit_count = 0

      # enemy_img = Image.load('scenes/game_hard/image/kuribo1.png')
      normal_enemy_img = Image.load("scenes/game_hard/image/teki_harisenbon.png")
      speed_enemy_img = Image.load("scenes/game_hard/image/speed_enemy.png")
      chase_enemy_img = Image.load("scenes/game_hard/image/matz.png")
      @enemys = []
      NOMAL_ENEMY_NUMBER.times do
        @enemys << NomalEnemy.new(rand(300)+150, rand(300)+150, normal_enemy_img)
      end
      SPEED_ENEMY_NUMBER.times do
        @enemys << SpeedEnemy.new(rand(300)+150, rand(300)+150, speed_enemy_img)
      end
      CHASE_ENEMY_NUMBER.times do
        @enemys << ChaseEnemy.new(rand(300)+150, rand(300)+150, chase_enemy_img)
      end

      player_img = Image.load("scenes/game_hard/image/ocean_kaichu_post.png")
      @player = Player.new(100, 100, player_img)

      @attack_image = Image.new(10, 10, [255, 0, 0])#("scenes/game_hard/image/kuribo1.png")
      @attacks = []

      @player.collision = [20,20,20]
      @enemys.each{|enemy| enemy.collision = [20,20,20]}

      @font_push_space = Font.new(80)
      @font_timer = Font.new(22, 'MS 明朝', weight: true, auto_fitting: true)


      @sound = Sound.new("scenes/game_hard/sound/sound.wav")

      @timer_img = Image.new(600, 22, [0, 0, 255])
      @time = 300

      @fps_counter = 0
    end

    def play
      Scene.move_to(:gameover) if @time >= 900
      Scene.move_to(:gameover) if !(@player.check(@enemys).empty?)

      # if Input.key_down?(K_RIGHT)
      #   @backgrounds.map(&:move_right)
      # end
      # if Input.key_down?(K_LEFT)
      #   @backgrounds.map(&:move_left)
      # end
      # if Input.key_down?(K_DOWN)
      #   @backgrounds.map(&:move_down)
      # end
      # if Input.key_down?(K_UP)
      #   @backgrounds.map(&:move_up)
      # end

      @backgrounds.map(&:draw)


      if @hit_count <= 6
        @shittin[@hit_count<=6 ? @hit_count : 6].move(@player)
        @shittin[@hit_count<=6 ? @hit_count : 6].draw
        @shittin[@hit_count<=6 ? @hit_count : 6].collision_enable = true
        @shittin[@hit_count<=6 ? @hit_count-1 : 6].collision_enable = false
      else
        @shittin[6].collision_enable = false
      end
      if !(@shittin[@hit_count<=6 ? @hit_count : 6].check(@player).empty?)
        @hit_count += 1
      end

      display(@hit_count)
      Scene.move_to(:ending) if (@hit_count >= 7 && Input.key_push?(K_RETURN))

      @enemys.each{|enemy| enemy.move(@player)}
      @enemys.each{|enemy| enemy.draw}
      @player.down if Input.key_down?(K_DOWN) || Input.key_down?(K_S)
      @player.up if Input.key_down?(K_UP) || Input.key_down?(K_W)
      @player.right if Input.key_down?(K_RIGHT) || Input.key_down?(K_D)
      @player.left if Input.key_down?(K_LEFT) || Input.key_down?(K_A)
      @player.draw

      # if Input.key_down?(K_LSHIFT) && @fps_counter % 20 == 0
      #   @attacks << Attack.new(@player.x+40,@player.y+20,@attack_image)
      # end
      #
      # Sprite.check(@attacks, @enemys)
      #
      # @attacks.each_with_index do |attack, i|
      #
      #   attack.move
      #   attack.draw



        # if attack.window_out
        #   attack.vanish
        #   @attacks.delete(i)
        # end
        # if !(attack.check(@enemys).empty?)
        #   attack.check(@emenys).each_with_index do |enemy, i|
        #     enemy.vanish
        #   end
        # end
      # end

      if @fps_counter % 60 >= 30
        Window.draw_font(230, 220, "ENTERキーを押してください", @font_push_space) if @hit_count >= 7
      end

      Window.draw(@time, 0, @timer_img)
      @time += TIMER_SPEED

      Window.draw_font(800, 0, 'タイマー', @font_timer)

      @sound.play if !(@player.check(@shittin).empty?)

      @fps_counter += 1
    end
  end
end
