require 'gosu'
require_relative 'card'
require_relative 'config'

class GameWindow < Gosu::Window
  def initialize
    super Config::WINDOW_WIDTH, Config::WINDOW_HEIGHT
    self.caption = 'My First Game'
  end

  def update
  end

  def draw
  end
end

window = GameWindow.new
window.show
