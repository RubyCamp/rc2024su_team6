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

      @line.update @opt

      handle_key_press
      handle_mouse_press
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

    def handle_mouse_press
      puts 'clicked pocket left' if @line.clicked_pocket_left?

      return unless @line.clicked_pocket_right?

      puts 'clicked pocket right'
    end
  end

  window = Tester.new
  window.show
end
