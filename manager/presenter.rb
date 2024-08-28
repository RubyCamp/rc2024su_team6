require 'gosu'
require_relative '../config'
require_relative '../card/presenter'
require_relative '../card-pocket/presenter'
require_relative '../flag/presenter'

module Manager
  class Presenter
    CARD_NUM = 6

    def initialize
      # 手札
      @cards = []
      x = 150
      y = 500
      CARD_NUM.times do |i|
        @cards << Card::Presenter.new('A', 'hart')
        @cards[i].set_position(x, y)
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

    def update(opt = {})
      @cards.each { |card| card.update(opt) }
      @pockets.each { |pocket| pocket.update(opt) }

      @cards.each do |card|
        next unless card.clicked?

        @current_card && @current_card.resize_middle
        @current_card = card
        @current_card.resize_large
        break
      end

      @pockets.each do |pocket|
        next unless pocket.clicked? && @current_card

        @current_card.set_position(pocket.x, pocket.y)
        @current_card.resize_small
        @current_card.turn_left
        @current_card = nil
      end
    end

    def draw
      @cards.each(&:draw)
      @pockets.each(&:draw)
      @flag.draw
    end
  end
end
