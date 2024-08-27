#ルール説明シーンの表示
module Scenes
  module Rule
    # ルール説明シーンの担当ディレクタークラス
    class Director < DirectorBase
      # コンストラクタ
      def initialize
        super
        @bg_img = Gosu::Image.("images/bg_title.png", tileable: true)
        @bgm = load_bgm("bgm1.mp3", 0.3)
      end

      # 1フレーム分の更新処理
      def update(opt = {})
        @bgm.play if @bgm && !@bgm.playing?
        # スペースキー押下でゲーム本編シーンへ切り替えを行う
        if key_push?(Gosu::KB_SPACE)
          transition(:game)
          @bgm.stop if @bgm && @bgm.playing?
        end
      end

      # 1フレーム分の描画処理
      def draw
        @bg_img.draw(0, 0, 0)
        draw_text("", :center, 100, font: :title, color: :black)
        draw_text("Push SPACE Key to start", :center, 350)
      end
    end
  end
