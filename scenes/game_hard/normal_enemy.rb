class NomalEnemy < Enemy
  def move(obj)
    super
    self.x += (rand(4)-2) * @dx
    self.y += (rand(4)-2) * @dx
  end
end
