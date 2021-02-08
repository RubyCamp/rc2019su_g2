require 'dxruby'

require_relative 'scene'
require_relative 'scenes/load_scene'



Window.caption = "RubyCamp Example"
Window.width   = 900
Window.height  = 563

bgm = Sound.new("sounds/bgm.mid")

Scene.move_to(:travel)
# bgm.play

Window.loop do
  Scene.play

  break if Input.key_push?(K_ESCAPE)
end
