module RC2024suTeam6
  module Rule
    # ルール説明シーンの担当プレゼンタークラス
    class Presenter < DirectorBase
      # コンストラクタ
      def initialize
        super
        @bg_img = Gosu::Image.new("assets/images/rule.png", tileable: true)
        @bgm = load_bgm("bgm2.mp3", 0.3)
      end

      # 1フレーム分の更新処理
      def update(opt = {})
        @bgm.play if @bgm && !@bgm.playing?
        # スペースキー押下でゲーム本編へ切り替えを行う
        if key_push?(Gosu::KB_SPACE)
          transition(:game)
          @bgm.stop if @bgm && @bgm.playing?
        end
      end

      # 1フレーム分の描画処理
      def draw
        @bg_img.draw(0, 0, 0)
        draw_text("ルール説明", :center, 100, font: :title, color: :white)
        draw_text("・2ターン目からドローできる\n・手札から１ターンに一枚ずつ指定されたフィールドに出せる\n・ライン上のカードの合計値がより２１に近い方がフラッグをとれる\n（２２以上になった場合はフラッグは相手のものになる）\n・一列ごとに”上or下”から2.2.3.3.3.3.4枚ずつ出さなければいけない\n・フラッグを相手より多くとった方が勝ち ", :left, 200, color: :white)
        draw_text("Push SPACE Key to start", :center, 500, color: :white)
      end
    end
  end
end