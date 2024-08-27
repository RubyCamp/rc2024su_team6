require 'gosu'
require_relative 'presenter'
require_relative '../test_window'

module CardPocket
  class Tester < TestWindow
    def initialize
      super

      @x = 100
      @y = 100
      @flag = Presenter.new
      @flag.set_position(@x, @y)
    end

    def update
      super
      handle_key_press
    end

    def draw
      @flag.draw
    end

    private

    def handle_key_press
      if Gosu.button_down?(Gosu::KB_LEFT)
        @flag.set_position(@x, @y)
      elsif Gosu.button_down?(Gosu::KB_RIGHT)
        @flag.set_position(@x + 100, @y)
      end
    end
  end

  window = Tester.new
  window.show
end
