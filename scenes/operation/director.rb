# module Opening
  class Director
    def initialize
      @text = Image.load("images/text.png")
    end

    def play
     Window.draw(0,0,@text)
    end
  end
# end
