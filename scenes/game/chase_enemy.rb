class ChaseEnemy < Enemy
  def move(player)
    super
    self.x += 3  * @dx * ((player.x - self.x)?1:-1)
    self.y += 3  * @dy * ((player.y - self.y)?1:-1)
  end
end
