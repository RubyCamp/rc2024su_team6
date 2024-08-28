module Card
  class Info
    attr_reader :number, :suit

    def initialize(number, suit)
      @number = number
      @suit = suit
    end

    def to_s
      "#{@number} of #{@suit}"
    end
  end
end
