require 'gosu'
require_relative 'manager'
require_relative 'director_base'
require_relative 'manager/presenter'
require_relative 'title/director'
require_relative 'rule/presenter'

class GameWindow < Gosu::Window
  def initialize
    super Config::WINDOW_WIDTH, Config::WINDOW_HEIGHT
    self.caption = 'Black Line'
    @scene_manager = Scenes::Manager.instance
    @scene_manager.add(:title, RC2024suTeam6::Title::Director.new)
    @scene_manager.add(:rule, RC2024suTeam6::Rule::Presenter.new)
    @scene_manager.set(:title)

    # @presenter = Manager::Presenter.new
  end

  def update
    exit if Gosu.button_down?(Gosu::KB_ESCAPE)
    opt = {
      mx: mouse_x,
      my: mouse_y
    }
    @scene_manager.update(opt)
  end

  def draw
    @scene_manager.draw
  end
end

window = GameWindow.new
window.show
