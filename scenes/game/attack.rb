class Attack<Sprite
  def initialize(x, y, image)
    @dx = 2
    super
  end
  
 def move
    self.x+=@dx
 end     
    
  
 def check
  self.x > (Window.width - self.image.width) 
 
 end
  end
