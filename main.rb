require 'gosu'
require_relative 'manager/presenter'

class GameWindow < Gosu::Window
  def initialize
    super Config::WINDOW_WIDTH, Config::WINDOW_HEIGHT
    self.caption = 'Black Line'

    @presenter = Manager::Presenter.new
  end

  def update
    opt = {
      mx: mouse_x,
      my: mouse_y
    }

    @presenter.update opt
  end

  def draw
    @presenter.draw
  end
end

window = GameWindow.new
window.show
