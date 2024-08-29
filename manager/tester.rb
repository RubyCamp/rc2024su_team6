require 'gosu'
require_relative 'presenter'
require_relative '../test_window'

module Manager
  class Tester < TestWindow
    def initialize
      super

      @manager = Presenter.new
    end

    def update
      super
      opt = {
        mx: mouse_x,
        my: mouse_y
      }
      @manager.update opt
      handle_key_press
    end

    def draw
      @manager.draw
    end

    private

    def handle_key_press
      # if Gosu.button_down?(Gosu::KB_LEFT)
      #   @flag.set_position(@x, @y)
      # elsif Gosu.button_down?(Gosu::KB_RIGHT)
      #   @flag.set_position(@x + 100, @y)
      # end
    end
  end

  window = Tester.new
  window.show
end
