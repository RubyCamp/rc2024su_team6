require 'gosu'
require_relative 'card'

class GameWindow < Gosu::Window
  WIDTH = 800
  HEIGHT = 600

  def initialize
    super WIDTH, HEIGHT
    self.caption = 'My First Game'

    @card = Card.new
    @card.setPosition(100, 100)
    # @card.turnLeft とかすると、左に向くようにしてほしい
  end

  def update
  end

  def draw
    @card.draw
  end
end

window = GameWindow.new
window.show
