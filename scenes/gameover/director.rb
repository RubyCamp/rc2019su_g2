module Gameover
  class Director
    def initialize
      @font_gameover = Font.new(102)
      @font_retry = Font.new(60)
    end

    def play
      Window.draw_font(230, 100, "Gameover", @font_gameover)
      Window.draw_font(370, 300, "Retry", @font_retry)

      if (Input.mouse_pos_x >= 370 && Input.mouse_pos_x <= 570 && Input.mouse_pos_y >= 300 && Input.mouse_pos_y <= 400 && Input.mouse_push?(M_LBUTTON))
        Scene.add(Game::Director.new,  :game)
        Scene.move_to(:game)
      end
    end
  end
end
