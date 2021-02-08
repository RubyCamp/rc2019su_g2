class SpeedEnemy < Enemy
  def move(obj)
    super

    self.x += (rand(10)-1) * @dx
    self.y += (rand(10)-1) * @dy

  end
end
