require_relative 'opening/director'
require_relative 'game/director'
require_relative 'ending/director'
require_relative 'gameover/director'

Scene.add(Opening::Director.new,  :opening)
Scene.add(Game::Director.new,  :game)
Scene.add(Ending::Director.new,  :ending)
Scene.add(Gameover::Director.new,  :gameover)
