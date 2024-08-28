require 'gosu'
require_relative 'manager/presenter'

class GameWindow < Gosu::Window
  def initialize
    super Config::WINDOW_WIDTH, Config::WINDOW_HEIGHT
    self.caption = 'Black Line'
    @scene_manager = Scenes::Manager.instance
    @scene_manager.add(:title, RC2024suTeam6::Title::Director.new)
    @scene_manager.add(:rule, RC2024suTeam6::Rule::Presenter.new)
    @scene_manager.set(:title)

    @presenter = Manager::Presenter.new
  end

  def update
    exit if Gosu.button_down?(Gosu::KB_ESCAPE)
    opt = {
      mx: self.mouse_x,
      my: self.mouse_y
    }

    @presenter.update opt
  end

  def draw
    @presenter.draw
  end
end

window = GameWindow.new
window.show
