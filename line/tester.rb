require 'gosu'
require_relative 'presenter'
require_relative '../test_window'
require_relative '../card/info'

module Line
  class Tester < TestWindow
    def initialize
      super

      @line = Presenter.new puttable_num: 3, x: 100, y: 100
    end

    def update
      super

      @line.update @opt

      handle_key_press
      handle_mouse_press
    end

    def draw
      @line.draw
    end

    private

    def handle_key_press
    end

    def handle_mouse_press
      @line.add_card_left Card::Info.new('A', 'hearts') if @line.clicked_pocket_left?

      return unless @line.clicked_pocket_right?

      @line.add_card_right Card::Info.new('A', 'hearts') if @line.clicked_pocket_right?
    end
  end

  window = Tester.new
  window.show
end
