require_relative '../modules/clickable'

module Card
  class Presenter
    include Clickable

    attr_accessor :x, :y, :angle, :scale
    def self.create_deck
      suits = ['hearts', 'diamonds', 'clubs', 'spades']
      numbers = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
      deck = []

      suits.each do |suit|
        numbers.each do |number|
          deck << new(number, suit)
        end
      end
      deck
    end

    def initialize(number, suit)
      @x = 0
      @y = 0
      @angle = 0
      @scale = 1
      @dx_number = 0
      @dy_number = 0
      @dx_suit = 0
      @dy_suit = 0

      @image = Gosu::Image.new('assets/images/card.png')
            # スート画像
            case suit
            when 'hearts'
              @suit_image = Gosu::Image.new('assets/images/heart.png')
            when 'diamonds'
              @suit_image = Gosu::Image.new('assets/images/diamond.png')
            when 'clubs'
              @suit_image = Gosu::Image.new('assets/images/culb.png')
            when 'spades'
              @suit_image = Gosu::Image.new('assets/images/spade.png')
            else
              raise "Unknown suit: #{suit}"
            end

            # 数字画像の設定
      color = suit == 'clubs' || suit == 'spades' ? 'black' : 'red'
      @number_image = Gosu::Image.new("assets/images/#{number}_#{color}.png")

    end

    def update(opt = {})
      mouse_position opt
      handle_click

      return unless @clicked

      p 'clicked!'
      p @mouse_x
    end

    def draw
      @image.draw_rot(@x, @y, 0, @angle, 0.5, 0.5, @scale, @scale)
       # 数字とスートをカードの中心に描画
       draw_number_and_suit
    end

    def draw_number_and_suit
        # スケーリングに基づいて位置調整
        number_x_adjustment = 0.32 * @number_image.width * @scale
        number_y_adjustment = @number_image.height / 2 * @scale
        suit_x_adjustment = @image.width / 100 * @scale
        suit_y_adjustment = @image.height / 40 * @scale
  
        # 数字画像をカードの中央に描画
        @number_image.draw_rot(
          @x - number_x_adjustment + @dx_number * @scale,
          @y - number_y_adjustment + @dy_number * @scale,
          1, @angle, 0.5, 0.5, 0.25 * @scale, 0.25 * @scale
        )
  
        # スート画像をカードの中央に描画
        @suit_image.draw_rot(
          @x + suit_x_adjustment + @dx_suit * @scale,
          @y + suit_y_adjustment + @dy_suit * @scale,
          1, @angle, 0.5, 0.5, 0.70 * @scale, 0.70 * @scale
        )
    end
    
    # カードを左に向ける
    def turn_left
      @angle = -90
      @dx_number = -15
      @dy_number = 73
      @dx_suit = 3
      @dy_suit = -2
    end

    # カードを右に向ける
    def turn_right
      @angle = 90
      @dx_number = 70
      @dy_number = 17
      @dx_suit = -5
      @dy_suit = -2
    end

    # カードを正面に向ける
    def turn_fore
      @angle = 0
      @dx_number = 0
      @dy_number = 0
      @dx_suit = 0
      @dy_suit = 0
    end

    # カードを小さいサイズにする
    def resize_small
      @scale = 0.5
    end

    # カードを中位のサイズにする
    def resize_middle
      @scale = 1
    end

    # カードを大きいサイズにする
    def resize_large
      @scale = 1.2
    end

    # カードの座標を変更する
    def set_position(x, y)
      @x = x
      @y = y
    end

    private

    def mouse_over?
      width = @image.width * @scale
      height = @image.height * @scale

      @x - width / 2 < @mouse_x && @mouse_x < @x + width / 2 && @y - height / 2 < @mouse_y && @mouse_y < @y + height / 2
    end
  end
end
