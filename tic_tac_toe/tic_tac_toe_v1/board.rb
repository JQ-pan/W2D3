class Board

    def initialize
        @lens = 3
        @grid = Array.new(@lens) {Array.new(@lens, '_')}
    end

    def valid?(position)
        position.all? {|ele| ele < @lens && ele >= 0}
    end

    def empty?(position)
        @grid[position[0]][position[1]] == '_'
    end

    def place_mark(position, mark)
        unless valid?(position) && empty?(position)
            raise Runtime.new "invalid mark"
        end
        @grid[position[0]][position[1]] = mark
    end

end
