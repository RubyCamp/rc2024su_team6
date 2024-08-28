require_relative '../card/presenter'

module Deal
  class Presenter
    attr_reader :clicked_card

    @@card_interval = 100

    def initialize(card_infos: [], x: 0, y: 0)
      @x = x
      @y = y

      @cards = []
      card_infos.each do |card_info|
        @cards << Card::Presenter.new(card_info)
        @cards.last.set_position(x, @y)
        x += @@card_interval
      end
    end

    def update(opt = {})
      @cards.each { |card| card.update(opt) }

      @cards.each do |card|
        if card.clicked?
          @clicked_card = card.info
          break
        else
          @clicked_card = nil
        end
      end
    end

    def draw
      @cards.each(&:draw)
    end

    def highlight(card_info)
      @cards.each do |card|
        if card.info == card_info
          card.resize_large
          break
        end
      end
    end

    def unhighlight(card_info)
      @cards.each do |card|
        if card.info == card_info
          card.resize_middle
          break
        end
      end
    end

    def add(card_info)
      x = (@cards.last&.x || @x) + @@card_interval
      y = @y
      @cards << Card::Presenter.new(card_info)
      @cards.last.set_position(x, y)
    end

    def remove(card_info)
      deleated_pos = nil
      @cards.each_with_index do |card, i|
        next unless card.info == card_info

        deleated_pos = i
        break
      end

      return unless deleated_pos

      (deleated_pos...@cards.size).each do |i|
        x = @cards[i].x - @@card_interval
        y = @cards[i].y
        @cards[i].set_position(x, y)
      end

      @cards.delete_at(deleated_pos)
    end
  end
end
