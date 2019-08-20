require 'dxruby'

require_relative 'director'
require_relative 'shittin'
#require_relative 'player'


Window.caption = "RubyCamp Example"
Window.width   = 800
Window.height  = 600

director = Director.new


Window.loop do
  director.play
end
