module Gameover
  class Director
    def initialize
      @font = Font.new(32)
    end

    def play
      Window.draw_font(100, 100, "Gameover", @font)
    end
  end
end
