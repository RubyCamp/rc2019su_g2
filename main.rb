require 'dxruby'
require_relative 'player'
require_relative 'director'
Window.caption = "rubycamp"

Window.width = 800
Window.height = 600

director = Director.new

Window.loop do
  director.play
end
