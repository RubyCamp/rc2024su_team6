require 'gosu'
require_relative 'card'

class GameWindow < Gosu::Window
  WIDTH = 800
  HEIGHT = 600

  def initialize
    super WIDTH, HEIGHT
    self.caption = 'My First Game'

    @card = Card.new 'A', 'hart'
    @card.set_position(100, 100)
    # @card.turn_left とかすると、左に向くようにしてほしい
  end

  def update
  end

  def draw
    @card.draw
  end
end

window = GameWindow.new
window.show
