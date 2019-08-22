class ChaseEnemy < Enemy
  def move(player)
    super
    self.x += 2 * ((player.x - self.x) > 0?1:-1)
    self.y += 2 * ((player.y - self.y) > 0?1:-1)
  end
end
