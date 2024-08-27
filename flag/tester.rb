require 'gosu'
require_relative 'presenter'
require_relative '../config'

class TestWindow < Gosu::Window
  def initialize
    super Config::WINDOW_WIDTH, Config::WINDOW_HEIGHT

    @x = 100
    @y = 100
    @flag = Flag::Presenter.new
    @flag.set_position(@x, @y)
  end

  def update
    handle_key_press
  end

  def draw
    @flag.draw
  end

  private

  def handle_key_press
    if Gosu.button_down?(Gosu::KB_LEFT)
      @flag.set_position(@x - 100, @y)
    elsif Gosu.button_down?(Gosu::KB_RIGHT)
      @flag.set_position(@x + 100, @y)
    elsif Gosu.button_down?(Gosu::KB_UP)
      @flag.set_position(@x, @y)
    end
  end
end

window = TestWindow.new
window.show
