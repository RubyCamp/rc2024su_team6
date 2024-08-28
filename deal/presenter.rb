require_relative '../card/presenter'

module Deal
  class Presenter
    attr_reader :clicked_card

    def initialize(card_infos: [], x: 0, y: 0)
      @x = x
      @y = y

      @cards = []
      card_infos.each do |card_info|
        @cards << Card::Presenter.new(card_info)
        @cards.last.set_position(x, @y)
        x += 100
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
  end
end
