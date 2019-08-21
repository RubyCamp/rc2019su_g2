 class Background < Sprite
    attr_accessor :dx
    attr_accessor :dy

    def move_right
      self.x += dx
      dx > 0? left_scroll_check : right_scroll_check
    end

    def left_scroll_check
      self.x = -Window.width if self.x >= Window.width
    end

    def right_scroll_check
      self.x = Window.width - 1 if self.x + Window.width < 0
    end



   def move_left
      self.x += 1
       left_scroll_check 
    end
   



   def move_down
      self.y+=dy
     dy > 0? down_scroll_check : up_scroll_check
    end

    def up_scroll_check
      self.y= -Window.height if self.y>= Window.height
    end

    def down_scroll_check
      self.y = Window.heigt - 1 if self.y +  Window.heigt< 0
    end
   



   def move_up
      self.y+= 1
       up_scroll_check 
    end
 
   
end