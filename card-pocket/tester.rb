require 'gosu'
require_relative 'presenter'
require_relative '../test_window'

module CardPocket
  class Tester < TestWindow
    def initialize
      super

      @x = 100
      @y = 100
      @pocket = Presenter.new
      @pocket.set_position(@x, @y)

      @click_count = 0
    end

    def update
      super
      @pocket.update
      handle_key_press
      handle_mouse_click
    end

    def draw
      @pocket.draw
    end

    private

    def handle_key_press
      if Gosu.button_down?(Gosu::KB_LEFT)
        @pocket.set_position(@x, @y)
      elsif Gosu.button_down?(Gosu::KB_RIGHT)
        @pocket.set_position(@x + 100, @y)
      end
    end

    def handle_mouse_click
      return unless @pocket.clicked?

      puts @click_count
      @click_count += 1
    end
  end

  window = Tester.new
  window.show
end
