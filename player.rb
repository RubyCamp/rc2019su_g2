class Player < Sprite

  def up
    self.y -= 5
  end
  def down
    self.y += 5
  end
  def right
    self.x += 5
  end
  def left
    self.x -= 5
  end
end
