# module Opening
  class Director
    def initialize
      @image = Image.load("images/title.png")
    end

    def play
     Window.draw(0,0,@image)
    end
  end
# end
