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
        @grid[position[0]][position[1]] = mark




    # def display
    #     puts @grid
    # end

end

# this = Board.new
# this.display