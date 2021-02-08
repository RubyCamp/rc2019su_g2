class Attack<Sprite
  def initialize(x, y, image)
    @dx = 2
    super
  end

 def move
    self.x+=@dx
 end


 def window_out
  self.x > (Window.width - self.image.width)

 end

 def shot(obj)
   self.vanish if obj.is_a?(Enemy)
 end

 # def hit(obj)
 #   puts "b"
 #   obj.vanish
 # end
end
