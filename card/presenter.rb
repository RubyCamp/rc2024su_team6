module Card
  class Presenter
    def initialize(number, signal)
      @x = 0
      @y = 0
      @angle = 0
      @scale = 1

      @image = Gosu::Image.new('assets/images/rect.png')
    end

    def draw
      @image.draw_rot(@x, @y, 0, @angle, 0.5, 0.5, @scale, 2 * @scale)
    end

    # カードを左に向ける
    def turn_left
      @angle = -90
    end

    # カードを右に向ける
    def turn_right
      @angle = 90
    end

    # カードを正面に向ける
    def turn_fore
      @angle = 0
    end

    # カードを中位のサイズにする
    def resize_middle
      @scale = 1
    end

    # カードを小さいサイズにする
    def resize_small
      @scale = 0.5
    end

    # カードの座標を変更する
    def set_position(x, y)
      @x = x
      @y = y
    end
  end
end
