class Teki
  def initialize(x, y, image_file)
    @x, @y = x, y
    @image = Image.load(image_file)
    @image.set_color_key([0, 0, 0])
    @dx = 1
  end
  def draw
     Window.draw(@x, @y, @image)
 end
  
  def move
     @x+=rand(4)-2
     @y+=rand(4)-2
end
end
    