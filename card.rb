require 'gosu'

class Card
  def initialize
    @x = 0
    @y = 0
  end

  def draw
    # 状態に応じて、カードを描画する

    # 現状、ただ四角形を表示するだけ
    Gosu.draw_rect(@x, @y, 100, 150, Gosu::Color::WHITE)
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
