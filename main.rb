require 'gosu'
require_relative 'config'
require_relative 'card/presenter'
require_relative 'card-pocket/presenter'
require_relative 'flag/presenter'
require_relative 'manager'
require_relative 'director_base'
require_relative 'title/director'
require_relative 'rule/presenter'


class GameWindow < Gosu::Window
  CARD_NUM = 6

  def initialize
    super Config::WINDOW_WIDTH, Config::WINDOW_HEIGHT
    self.caption = 'Black Line'
    @scene_manager = Scenes::Manager.instance
    @scene_manager.add(:title, RC2024suTeam6::Title::Director.new)
    @scene_manager.add(:rule, RC2024suTeam6::Rule::Presenter.new)
    @scene_manager.set(:title)

    # 手札
    @cards = []
    x = 150
    y = 500
    CARD_NUM.times do |i|
      @cards << Card::Presenter.new('A', 'hart')
      @cards[i].set_position(x, y)
      p 'init card'
      x += 100
    end

    # カードポケット
    @pockets = []

    x = 60
    y = 200
    (CARD_NUM / 2).times do |i|
      @pockets << CardPocket::Presenter.new
      @pockets[i].set_position(x, y)
      x += 100
    end

    @flag = Flag::Presenter.new
    @flag.set_position(x, y)

    x += 100

    (CARD_NUM / 2).upto(CARD_NUM - 1) do |i|
      @pockets << CardPocket::Presenter.new
      @pockets[i].set_position(x, y)
      x += 100
    end
  end

  def update
    exit if Gosu.button_down?(Gosu::KB_ESCAPE)
    opt = {
      mx: self.mouse_x,
      my: self.mouse_y
    }
    @scene_manager.update(opt)
    # opt = {
    #   mx: mouse_x,
    #   my: mouse_y
    # }
    # @cards.each { |card| card.update(opt) }

    # @cards.each do |card|
    #   next unless card.clicked?

    #   @current_card && @current_card.resize_middle
    #   @current_card = card
    #   @current_card.resize_large
    #   break
    # end
  end

  def draw
    @scene_manager.draw
    # @cards.each(&:draw)
    # @pockets.each(&:draw)
    # @flag.draw
  end
end

window = GameWindow.new
window.show
