module Gameover
  class Director
    def initialize
      @font_gameover = Font.new(102)
      @font_retry = Font.new(60)
    end

    def play
      Window.draw_font(230, 100, "Gameover", @font_gameover)
      Window.draw_font(370, 300, "Retry", @font_retry)

      # Input.mouse_pos_x >= 370 && Input.mouse_pos_x <= 570 && Input.mouse_pos_y >= 300 && Input.mouse_pos_y <= 400

      if (Input.mouse_pos_x >= 370 && Input.mouse_pos_x <= 570 && Input.mouse_pos_y >= 300 && Input.mouse_pos_y <= 400 && Input.mouse_push?(M_LBUTTON)) || Input.key_push?(K_SPACE)
        Scene.add(GameEasy::Director.new,  :game_easy)
        Scene.add(GameNormal::Director.new,  :game_normal)
        Scene.add(GameHard::Director.new,  :game_hard)
        Scene.move_to(:opening)
      end
    end
  end
end
