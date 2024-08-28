require_relative '../card/presenter'
require_relative '../card-pocket/presenter'
require_relative '../flag/presenter'

module Line
  class Presenter
    def initialize(puttable_num:, x: 0, y: 0)
      @x = x
      @y = y
      @puttable_num = puttable_num

      # カードポケット
      @pockets = []

      x = @x
      y = @y
      @puttable_num.times do |i|
        @pockets << CardPocket::Presenter.new
        @pockets[i].set_position(x, y)
        x += 100
      end

      @flag = Flag::Presenter.new
      @flag.set_position(x, y)
      x += 100

      @puttable_num.upto(2 * @puttable_num) do |i|
        @pockets << CardPocket::Presenter.new
        @pockets[i].set_position(x, y)
        x += 100
      end
    end

    def update(opt = {})
      @pockets.each { |pocket| pocket.update(opt) }

      @pockets.each do |pocket|
        next unless pocket.clicked? && @current_card

        @current_card.set_position(pocket.x, pocket.y)
        @current_card.resize_small
        @current_card.turn_left
        @current_card = nil
      end
    end

    def draw
      @pockets.each(&:draw)
      @flag.draw
    end
  end
end
