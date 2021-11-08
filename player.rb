class Player
    attr_accessor :score, :name

    def initialize (name)
        @name =name
        @score = 3
    end

    def score_tracker
        "#{@score}/3"
    end
end