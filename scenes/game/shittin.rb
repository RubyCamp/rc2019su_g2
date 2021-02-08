class Shittin < Sprite
  def initialize(x, y, img)
    super
    @dx = 1
    @dy = 1
  end
  def move(player)
    # @dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
    # @dy = -@dy if self.y > (Window.height - self.image.height) || self.y < 0

    self.x > (Window.width - self.image.width) || self.x < 0 ? self.x = self.x : self.x += 0.5 * ((self.x - player.x) > 0?1:-1)
    self.y > (Window.height - self.image.height) || self.y < 0 ? self.y = self.y : self.y += 0.5 * ((self.y - player.y) > 0?1:-1)
  end
end
