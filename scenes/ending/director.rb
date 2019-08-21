module Ending
  class Director
    def initialize
      @font = Font.new(32)
    end

    def play
      Scene.move_to(:credit) if Input.key_push?(K_SPACE)

      Window.draw_font(100, 100, "ENDING", @font)
    end
  end
end
