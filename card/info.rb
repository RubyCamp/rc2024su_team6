module Card
  class Info
    attr_reader :number, :suit

    def initialize(number, suit)
      @number = number
      @suit = suit
    end
  end
end
