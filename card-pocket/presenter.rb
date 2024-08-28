require 'gosu'

module CardPocket
  class Presenter
    def initialize
      @x = 0
      @y = 0

      @image = Gosu::Image.new('assets/images/rect.png')
    end

    def draw
      @image.draw @x, @y, 0
    end

    def set_position(x, y)
      @x = x
      @y = y
    end
  end
end
