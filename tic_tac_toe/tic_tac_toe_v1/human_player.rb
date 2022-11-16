class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Player X, enter two numbers representing a position in the formation `row col`"
        raw_position = gets.chomp
        raise ArgumentError.new "invalid position" if raw_position.length != 3
        true_position = [raw_position[0].to_i, raw_position[2].to_i]
    end
end