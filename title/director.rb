require 'gosu'
require_relative '../config'

module RC2024suTeam6
  module Title
    # タイトルシーンの担当ディレクタークラス
    class Director < DirectorBase
      FONT_FILENAME = "DelaGothicOne-Regular.ttf" # 画面描画用フォントファイル名
      RIGHT_MARGIN = 10 # 文字列描画における右端寄せ指定の際の右側余白ピクセル数
      @@key_state = {}
      # コンストラクタ
      def initialize
        @bg_img = Gosu::Image.new("assets/images/title.png", tileable: true)
        @fonts = {
        base: Gosu::Font.new(32, name: FONT_FILENAME),
        title: Gosu::Font.new(80, name: FONT_FILENAME),
        score: Gosu::Font.new(64, name: FONT_FILENAME),
        judgement_result: Gosu::Font.new(128, name: FONT_FILENAME),
      }

      @colors = {
        black: 0xff_000000,
        white: 0xff_ffffff,
        red: 0xff_ff0000,
        green: 0xff_00ff00,
        blue: 0xff_0000ff,
      }
      end

      # 1フレーム分の更新処理
      def update(opt = {})
        @bgm.play if @bgm && !@bgm.playing?
        # スペースキー押下でルール説明へ切り替えを行う
        if key_push?(Gosu::KB_SPACE)
          transition(:rule)
          @bgm.stop if @bgm && @bgm.playing?
        end
      end

      # 1フレーム分の描画処理
      def draw
        @bg_img.draw(0, 0, 0)
        draw_text("BLACK LINE", :center, 200, font: :title, color: :black)
        draw_text("Push SPACE Key to start", :center, 350)
      end
      def key_push?(key_label)
        if !@@key_state[key_label] && Gosu.button_down?(key_label)
          @@key_state[key_label] = true
          return true
        end
        if @@key_state[key_label] && !Gosu.button_down?(key_label)
          @@key_state[key_label] = false
        end
        return false
      end
      def draw_text(text, x, y, opt = {})
      font = @fonts[:base]
      if opt.has_key?(:font)
        font = @fonts[opt[:font].to_sym]
      end

      pos_x = 0
      if x.is_a?(Symbol)
        pos_x = convert_x_pos(x, text, font)
      else
        pos_x = x
      end

      z = 300
      if opt.has_key?(:z)
        z = opt[:z].to_i
      end

      scale_x = 1
      if opt.has_key?(:scale_x)
        scale_y = opt[:scale_x].to_f
      end

      scale_y = 1
      if opt.has_key?(:scale_y)
        scale_y = opt[:scale_y].to_f
      end

      color = @colors[:black]
      if opt.has_key?(:color)
        if(opt[:color].is_a?(Symbol))
          color = @colors[opt[:color]]
        else
          color = opt[:color]
        end
      end

      font.draw_text(text, pos_x, y, z, scale_x, scale_y, color)
    end
    def convert_x_pos(x, text, font)
      case x
      when :left
        return 0
      when :center
        return 800 / 2 - (font.text_width(text) / 2)
      when :right
        return 800 - font.text_width(text) - RIGHT_MARGIN
      end
    end
    end
  end
end