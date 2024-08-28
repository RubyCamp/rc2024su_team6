require 'gosu'
require_relative 'presenter'
require_relative '../test_window'
require_relative '../card/info'

module Deal
  class Tester < TestWindow
    def initialize
      super

      card_infos = [
        Card::Info.new('A', 'hearts'),
        Card::Info.new('2', 'hearts'),
        Card::Info.new('3', 'hearts')
      ]
      @deal = Presenter.new card_infos: card_infos, x: 100, y: 100

      @click_count = 0
    end

    def update
      super
      @deal.update @opt
      handle_mouse_press
    end

    def draw
      @deal.draw
    end

    private

    def handle_mouse_press
      return unless @deal.clicked_card

      puts @deal.clicked_card

      if @click_count.even?
        @deal.highlight @deal.clicked_card
      else
        @deal.unhighlight @deal.clicked_card
      end
      @click_count += 1
    end
  end

  window = Tester.new
  window.show
end
