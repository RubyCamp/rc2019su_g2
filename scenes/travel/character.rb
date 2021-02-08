class Character<Sprite

def up
    self.y -= 5 unless self.y < 0
  end
  def down
    self.y += 5 unless self.y > (Window.height - self.image.height)
  end
  def right
    self.x += 5 unless self.x > (Window.width - self.image.width)
  end
  def left
    self.x -= 5 unless self.x < 0
  end
end

  
