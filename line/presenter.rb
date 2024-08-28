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
      @flag.set_position(x, y)
      x += 100

      @puttable_num.times do |i|
        @pockets_right << CardPocket::Presenter.new
        @pockets_right[i].set_position(x, y)
        x += 100
      end
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
    end

    def clicked_pocket_left?
      @_clicked_pocket_left
    end

    def clicked_pocket_right?
      @_clicked_pocket_right
    end
  end
end
