module Opening
  class Director
    def initialize
      @image = Image.load("scenes/opening/title.png")
    end

    def play
    Scene.move_to(:operation) if Input.key_push?(K_SPACE)

     Window.draw(0,0,@image)
    end
  end
end
