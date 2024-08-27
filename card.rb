require 'gosu'

class Card
  def initialize(number, signal)
    @x = 0
    @y = 0
    @number_image = Gosu::Image.new("assets/images/card/number/#{number}.png")
    @signal_image = Gosu::Image.new("assets/images/card/signal/#{signal}.png")
  end

  def draw
    # 状態に応じて、カードを描画する

    # カードの背景
    Gosu.draw_rect(@x, @y, 100, 150, Gosu::Color::WHITE)

    @number_image.draw(@x, @y, 0, 0.5, 0.5)
    @signal_image.draw(@x + 50, @y, 0, 0.5, 0.5)
  end

  # カードを左に向ける
  def turnLeft
  end

  # カードを右に向ける
  def turnRight
  end

  # カードを正面に向ける
  def turnFore
  end

  # カードを中位のサイズにする
  def resizeMiddle
  end

  # カードを小さいサイズにする
  def resizeSmall
  end

  def setPosition(x, y)
    @x = x
    @y = y
  end
end
