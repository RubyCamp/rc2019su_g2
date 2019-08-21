module Ending
  class Director
    def initialize
      @font = Font.new(32)
    end

    def play
      Window.draw_font(100, 100, "ENDING", @font)
    end
  end
end
