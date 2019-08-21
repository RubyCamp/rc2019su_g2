require 'dxruby'

require_relative 'director'


Window.caption = "RubyCamp Example"
Window.width   = 900
Window.height  = 650
director = Director.new

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  director.play
end
