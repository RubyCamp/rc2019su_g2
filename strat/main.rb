require 'dxruby'

require_relative 'director'
require_relative 'character'

Window.caption = "RubyCamp Example"
Window.width   = 800
Window.height  = 600

director = Director.new


Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  director.play
end
