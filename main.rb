require 'dxruby'

require_relative 'scene'
require_relative 'scenes/load_scene'



Window.caption = "RubyCamp Example"
Window.width   = 800
Window.height  = 600

bgm = Sound.new("sounds/bgm.mid")

Scene.move_to(:opening)
# bgm.play

Window.loop do
  Scene.play

  break if Input.key_push?(K_ESCAPE)
end
