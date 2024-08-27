require 'gosu'
require_relative 'presenter'
require_relative '../config'

module Card
  class TestWindow < Gosu::Window
    def initialize
      super Config::WINDOW_WIDTH, Config::WINDOW_HEIGHT

      @card = Presenter.new('A', 'hart')
      @card.set_position(100, 100)
    end

    def update
      handle_key_press

      opt = {
        mx: mouse_x,
        my: mouse_y
      }

      @card.update opt
    end

    def draw
      @card.draw
    end

    private

    def handle_key_press
      if Gosu.button_down?(Gosu::KB_LEFT)
        @card.turn_left
      elsif Gosu.button_down?(Gosu::KB_RIGHT)
        @card.turn_right
      elsif Gosu.button_down?(Gosu::KB_UP)
        @card.turn_fore
      elsif Gosu.button_down?(Gosu::KB_S)
        @card.resize_small
      elsif Gosu.button_down?(Gosu::KB_M)
        @card.resize_middle
      end
    end
  end

  window = TestWindow.new
  window.show
end
