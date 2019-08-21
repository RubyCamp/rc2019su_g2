#module Ending
  class Director < DirectorBase
    FONT_SIZE = 10
    def prepare_scene
      @words = %w(
        player　nanami0408さんによる写真ACからの写真  https://www.ac-illust.com/
うなぎ　三浦さくさんによるイラストACからのイラスト　〃
わかさぎ　HiCさんによる写真ACからの写真　〃
しらうお　Hinamaluさんによる写真ACからの写真 〃
こい　わーい！たむたむさんによる写真ACからの写真 　〃
すずき　photolibrary　https://www.photolibrary.jp
しじみ　ねこ画伯コハクちゃん　https://kohacu.com/20170513post-9047
えび　パブリックドメインQ：著作権フリー画像素材集　https://publicdomainq.net/boiled-shrimp-food-0015019/
背景　〃　〃
タイトル背景　ばんない堂　https://098free.com/rule/
        )
      @font = Font.new(FONT_SIZE, 'MS 明朝', weight: true)
      @scroll_y = 0
    end

    def play
      @scroll_y += 1
      frame_out = []

      @words.each_with_index do |word, i|
        draw_x = Window.width / 3
        draw_y = (Window.height + i * FONT_SIZE) - @scroll_y
        # 文字にマウスオーバーしていたら赤色を指定する
        color = word_mouse_over?(word, draw_x, draw_y) ? [255, 0, 0] : [255, 255, 255]
        Window.draw_font(draw_x, draw_y, word, @font, color: color)
     end
  end
end
