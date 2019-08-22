module Operation
  class Director
    def initialize
      @text = Image.load("scenes/operation/text.png")
    end

    def play
    Scene.move_to(:opening) if Input.key_push?(K_SPACE)

     Window.draw(0,0,@text)
    end
  end
end
