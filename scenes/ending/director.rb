module Ending
  class Director
    def initialize
      @edImg = Image.load("scenes/ending/image/ending.png")
    end

    def play
      Scene.move_to(:credit) if Input.key_push?(K_SPACE)

      Scene.move_to(:opening) if Input.key_push?(K_Q)

      Window.draw(0, 0,@edImg)
    end
  end
end
