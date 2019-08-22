class NomalEnemy < Enemy
  # def initialize(x, y, img)
  #   super
  # end
  # def hit(ovj)
  #   super
  # end
  def move(obj)
    super
    self.x += (rand(4)-2) * @dx
    self.y += (rand(4)-2) * @dx
  end
end
