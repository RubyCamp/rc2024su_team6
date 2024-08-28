require 'gosu'
require_relative 'config'

class TestWindow < Gosu::Window
  def initialize
    super Config::WINDOW_WIDTH, Config::WINDOW_HEIGHT
  end

  def update
    @opt = {
      mx: mouse_x,
      my: mouse_y
    }
  end
end
