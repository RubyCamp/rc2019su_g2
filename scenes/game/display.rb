def display(hit_count)
  chars = ["ス","モ","ウ","ア","シ","コ","シ"]

  font = Font.new(32)

  chars.first(hit_count).each_with_index do |char, i|
    Window.draw_font((10+(i*32)),550,char,font)
  end
end
