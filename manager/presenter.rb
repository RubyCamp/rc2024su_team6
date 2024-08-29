require 'gosu'
require_relative '../config'
require_relative '../card/info'
require_relative '../deal/presenter'
require_relative '../line/presenter'

module Manager
  class Presenter
    def initialize
      card_infos = [
        Card::Info.new('A', 'hearts'),
        Card::Info.new('2', 'hearts'),
        Card::Info.new('3', 'hearts')
      ]

      @line0 = Line::Presenter.new(puttable_num: 3, x: 100, y: 100)
      @line1 = Line::Presenter.new(puttable_num: 3, x: 100, y: 200)
      @line2 = Line::Presenter.new(puttable_num: 3, x: 100, y: 300)
      @deal = Deal::Presenter.new card_infos: card_infos, x: 310, y: 500
    end

    def update(opt = {})
      @line0.update(opt)
      @line1.update(opt)
      @line2.update(opt)
      @deal.update(opt)
    end

    def draw
      @line0.draw
      @line1.draw
      @line2.draw
      @deal.draw
    end

    private

    def check_clicked_card
    end
  end
end
