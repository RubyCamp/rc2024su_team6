require 'gosu'
require_relative 'presenter'
require_relative '../test_window'

module Line
  class Tester < TestWindow
    def initialize
      super

      @line = Presenter.new puttable_num: 3, x: 100, y: 100
    end

    def update
      super

      handle_key_press

      @line.update @opt
    end

    def draw
      @line.draw
    end

    private

    def handle_key_press
      # if Gosu.button_down?(Gosu::KB_LEFT)
      #   @flag.set_position(@x - 100, @y)
      # elsif Gosu.button_down?(Gosu::KB_RIGHT)
      #   @flag.set_position(@x + 100, @y)
      # elsif Gosu.button_down?(Gosu::KB_UP)
      #   @flag.set_position(@x, @y)
      # end
    end
  end

  window = Tester.new
  window.show
end
