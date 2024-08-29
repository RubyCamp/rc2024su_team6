require_relative '../card/presenter'
require_relative '../card-pocket/presenter'
require_relative '../flag/presenter'

module Line
  class Presenter
    def initialize(puttable_num:, x: 0, y: 0)
      @x = x
      @y = y
      @puttable_num = puttable_num

      @_clicked_pocket_left = false
      @_clicked_pocket_right = false

      # カードポケット
      @pockets_left = []
      @pockets_right = []

      x = @x
      y = @y
      @puttable_num.times do |i|
        @pockets_left << CardPocket::Presenter.new
        @pockets_left[i].set_position(x, y)
        x += 100
      end

      @flag = Flag::Presenter.new
      @flag.set_position(x - 30, y - 30)
      x += 100

      @puttable_num.times do |i|
        @pockets_right << CardPocket::Presenter.new
        @pockets_right[i].set_position(x, y)
        x += 100
      end

      @cards_left = []
    end

    def update(opt = {})
      @pockets_left.each { |pocket| pocket.update(opt) }
      @pockets_right.each { |pocket| pocket.update(opt) }

      @pockets_left.each do |pocket|
        if pocket.clicked?
          @_clicked_pocket_left = true
          break
        else
          @_clicked_pocket_left = false
        end
      end

      @pockets_right.each do |pocket|
        if pocket.clicked?
          @_clicked_pocket_right = true
          break
        else
          @_clicked_pocket_right = false
        end
      end
    end

    def draw
      @pockets_left.each(&:draw)
      @flag.draw
      @pockets_right.each(&:draw)
      @cards_left.each(&:draw)
    end

    def clicked_pocket_left?
      @_clicked_pocket_left
    end

    def clicked_pocket_right?
      @_clicked_pocket_right
    end

    def add_card_left(card_info)
      return false if @cards_left.size >= @puttable_num

      pos = @pockets_left.size - @cards_left.size - 1
      @cards_left.unshift Card::Presenter.new('A', 'hearts')
      @cards_left[0].set_position(@pockets_left[pos].x, @pockets_left[pos].y)
      @cards_left[0].turn_right
      @cards_left[0].resize_small

      true
    end

    def add_card_right(card_info)
      return false if @cards_left.size >= @puttable_num

      pos = @cards_left.size
      @cards_left << Card::Presenter.new('A', 'hearts')
      @cards_left.last.set_position(@pockets_right[pos].x, @pockets_right[pos].y)
      @cards_left.last.turn_right
      @cards_left.last.resize_small

      true
    end
  end
end
