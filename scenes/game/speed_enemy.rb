class SpeedEnemy < Enemy
  # def initialize(x, y, img)
  #   super
  # end
  #
  # def hit(obj)
  #   super
  # end

  def move(obj)
    super

    self.x += (rand(10)-1) * @dx
    self.y += (rand(10)-1) * @dy

  end
end
