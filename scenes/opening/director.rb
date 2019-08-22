module Opening
  class Director
    def initialize
      @image = Image.load("scenes/opening/title.png")
      @image_easy = Image.new(200, 70,[255, 0, 0]  )
      @image_normal = Image.new(200, 70,[255, 0, 0]  )
      @image_hard = Image.new(200, 70,[255, 0, 0]  )
      @font_Level = Font.new(50, 'MS 明朝', weight: true, )
      @font_explain = Font.new(30)

    end

    def play
    Scene.move_to(:operation) if Input.key_push?(K_SPACE)

    (Input.mouse_pos_x >= 350 && Input.mouse_pos_x <= 550 && Input.mouse_pos_y >= 210 && Input.mouse_pos_y <= 280) ? @image_easy = Image.new(200, 70, [200, 20, 0]) : @image_easy = Image.new(200, 70,[255, 0, 0]  )
    (Input.mouse_pos_x >= 350 && Input.mouse_pos_x <= 550 && Input.mouse_pos_y >= 310 && Input.mouse_pos_y <= 380) ? @image_normal = Image.new(200, 70, [200, 20, 0]) : @image_normal = Image.new(200, 70, [255, 0, 0])
    (Input.mouse_pos_x >= 350 && Input.mouse_pos_x <= 550 && Input.mouse_pos_y >= 410 && Input.mouse_pos_y <= 480) ? @image_hard = Image.new(200, 70, [200, 20, 0]) : @image_hard = Image.new(200, 70, [255, 0, 0])

    Scene.move_to(:game_easy) if (Input.mouse_pos_x >= 350 && Input.mouse_pos_x <= 550 && Input.mouse_pos_y >= 210 && Input.mouse_pos_y <= 280 && Input.mouse_push?(M_LBUTTON)) || Input.key_push?(K_C)
    Scene.move_to(:game_normal) if (Input.mouse_pos_x >= 350 && Input.mouse_pos_x <= 550 && Input.mouse_pos_y >= 310 && Input.mouse_pos_y <= 380 && Input.mouse_push?(M_LBUTTON)) || Input.key_push?(K_V)
    Scene.move_to(:game_hard) if (Input.mouse_pos_x >= 350 && Input.mouse_pos_x <= 550 && Input.mouse_pos_y >= 410 && Input.mouse_pos_y <= 480 && Input.mouse_push?(M_LBUTTON)) || Input.key_push?(K_B)

     Window.draw(0,0,@image)
     Window.draw(350, 210 ,@image_easy)
     Window.draw(350, 310,@image_normal)
     Window.draw(350, 410 ,@image_hard)
     Window.draw_font(385, 220 ,"イージー", @font_Level)
     Window.draw_font(385, 320 ,"ノーマル", @font_Level)
     Window.draw_font(400, 420 ,"ハード", @font_Level)
     Window.draw_font(600, 500, "SPACE : 操作説明", @font_explain)

    end
  end
end
