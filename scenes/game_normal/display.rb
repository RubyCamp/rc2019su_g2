def display(hit_count)
  chars = ["ス","モ","ウ","ア","シ","コ","シ"]

  font = Font.new(50)

  chars.first(hit_count).each_with_index do |char, i|
    Window.draw_font((10+(i*50)),500,char,font)
  end
end
