require 'gosu'
require_relative '../modules/clickable'

module Flag
  class Presenter
    include Clickable

    def initialize
      @x = 0
      @y = 0

      @image = Gosu::Image.new('assets/images/rect.png')
    end

    def update(opt = {})
      mouse_position opt
      handle_click

      return unless @clicked

      p 'clicked!'
      p @mouse_x
    end

    def draw
      @image.draw @x, @y, 0
    end

    def set_position(x, y)
      @x = x
      @y = y
    end

    def mouse_over?
      @mouse_x > @x && @mouse_x < @x + @image.width &&
        @mouse_y > @y && @mouse_y < @y + @image.height
    end
  end
end
