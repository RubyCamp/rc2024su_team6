require 'gosu'
require_relative 'card'

class GameWindow < Gosu::Window
  WIDTH = 800
  HEIGHT = 600

  def initialize
    super WIDTH, HEIGHT
    self.caption = 'My First Game'
  end

  def update
  end

  def draw
  end
end

window = GameWindow.new
window.show
