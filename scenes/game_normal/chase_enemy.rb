class ChaseEnemy < Enemy
  def move(player)
    super
    self.x += 2  * @dx * ((player.x - self.x) > 0?1:-1)
    self.y += 2  * @dy * ((player.y - self.y) > 0?1:-1)
  end
end
