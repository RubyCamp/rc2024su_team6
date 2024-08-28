require 'gosu'

module CardPocket
  class Presenter
    def initialize
      @x = 0
      @y = 0

      @image = Gosu::Image.new('assets/images/blankcard.png')
    end

    def draw
      @image.draw_rot(@x, @y, 0, 0, 0.5, 0.5, 0.75, 0.75)
    end

    def set_position(x, y)
      @x = x
      @y = y
    end
  end
end
