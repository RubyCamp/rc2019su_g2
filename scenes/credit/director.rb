module Credit
  class Director
    FONT_SIZE = 30
    def initialize
      @words = %w(
        player　nanami0408さんによる写真ACからの写真  https://www.ac-illust.com/
        うなぎ　三浦さくさんによるイラストACからのイラスト　〃
        わかさぎ　HiCさんによる写真ACからの写真　〃
        しらうお　Hinamaluさんによる写真ACからの写真 〃
        こい　わーい！たむたむさんによる写真ACからの写真 　〃
        すずき　photolibrary　https://www.photolibrary.jp
        しじみ　ねこ画伯コハクちゃん　https://kohacu.com/20170513post-9047
        えび　パブリックドメインQ：著作権フリー画像素材集　
        https://publicdomainq.net/boiled-shrimp-food-0015019/
        背景　〃　〃
        タイトル背景　ばんない堂　https://098free.com/rule/
        　
        　
        製作者
        　
        松田陸斗
        青砥朋紀
        平池竜大
        吉見昂大
        福間陽菜
        　
        　
        　
        　
        　
        　
        　
        　
        　
        　
        　
        　
        Thank you
        )
      @font = Font.new(FONT_SIZE, 'MS 明朝', weight: true)
      @scroll_y = 0
    end

    def play
      @scroll_y += 1 unless Input.key_down?(K_SPACE)
      @scroll_y += 5 if Input.key_down?(K_RETURN)
      frame_out = []

      @words.each_with_index do |word, i|
        draw_x = Window.width / 30
        draw_y = (Window.height + i * FONT_SIZE) - @scroll_y
        # 文字にマウスオーバーしていたら赤色を指定する
        Window.draw_font(draw_x, draw_y, word, @font)
     end
  end
end
end
