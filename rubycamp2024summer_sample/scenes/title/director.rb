module Scenes
  module Title
    # タイトルシーンの担当ディレクタークラス
    class Director < DirectorBase
      # コンストラクタ
      def initialize
        super
        @bg_img = Gosu::Image.new("images/bg_title.png", tileable: true)
        @bgm = load_bgm("bgm1.mp3", 0.3)
      end

      # 1フレーム分の更新処理
      def update(opt = {})
        @bgm.play if @bgm && !@bgm.playing?
        # スペースキー押下でゲーム画面へ遷移
        if Gosu.button_down?(Gosu::KB_SPACE)
          # ゲーム画面へ遷移
          @scene_manager.set(:game)
        end
      end

      # 1フレーム分の描画処理
      def draw
        @bg_img.draw(0, 0, 0)
        draw_text("BLACK LINE", :center, 200, font: :title, color: :black)
        draw_text("Push SPACE Key to start", :center, 350)
      end
    end
  end
end