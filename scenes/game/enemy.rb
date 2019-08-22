class Enemy < Sprite
  def initialize(x, y, img)
  #   @x, @y = x, y
  #   @image = Image.load(image_file)
  #   @image.set_color_key([0, 0, 0])
    super
    @dx = 1
    @dy = 1
  end
 #  def draw
 #     Window.draw(@x, @y, @image)
 # end

  def move(player)
    @dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
    @dy = -@dy if self.y > (Window.height - self.image.height) || self.y < 0
  end

  def hit(obj)
    self.vanish if obj.is_a?(Attack)
  end
end
