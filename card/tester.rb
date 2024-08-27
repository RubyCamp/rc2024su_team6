require 'gosu'
require_relative 'presenter'
require_relative '../test_window'
module Card
  class Tester < TestWindow
    def initialize
      super

      @card = Presenter.new('A', 'hart')
      @card.set_position(100, 100)
    end

    def update
      super

      handle_key_press

      @card.update @opt
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
      elsif Gosu.button_down?(Gosu::KB_L)
        @card.resize_large
      end
    end
  end

  window = Tester.new
  window.show
end
