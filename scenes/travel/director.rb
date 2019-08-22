require_relative 'character'

module Travel
 class Director
  def initialize


    @counter = 0
    @char = Character.new(700, 500, Image.load("scenes/travel/images/char.png"))
    @bg_img = Image.load("scenes/travel/images/background.png")
    @shimane=Sprite.new(260,340,Image.load("scenes/travel/images/shimane.png"))
	@matsue=Sprite.new(580,245,Image.load("scenes/travel/images/shimane2.png"))
	@is_vanish_shimane = false
	@is_vanish_matsue = false
  end

  def change_image_shimane(point,haikei)
    unless @is_vanish_shimane
		if (@char === @shimane)
			@bg_img=Image.load(haikei)
			@shimane.vanish
			@is_vanish_shimane = true
			@counter += 1
		end
	end
  end

  def change_image_matsue(point,haikei)
	 if @is_vanish_shimane
	   unless @is_vanish_matsue
	    @matsue.draw
		if (@char === @matsue)
			#@bg_img=Image.load(haikei)
			Scene.move_to(:opening)
			#point.vanish
			#if(point===@matsue)
			@counter += 1
		end
	  end
	end

  end

  def play
    Window.draw(0, 0, @bg_img)

    @char.down if Input.key_down?(K_DOWN)
    @char.up if Input.key_down?(K_UP)
    @char.right if Input.key_down?(K_RIGHT)
    @char.left if Input.key_down?(K_LEFT)
    @char.draw
	@shimane.draw

	change_image_shimane(@shimane,"scenes/travel/images/background2.png")
	change_image_matsue(@matsue,"scenes/travel/images/background2.png")
  end
end
end
