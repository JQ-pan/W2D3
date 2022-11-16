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
        raise RuntimeError.new "invalid position" if !valid?(position) 
        raise RuntimeError.new "position not empty" if !empty?(position) 
        @grid[position[0]][position[1]] = mark
    end


    def print
        @grid.each{|row| p row.join(" ")}
    end

    def win_row?(mark)
        @grid.any? do |row|
            row.all? {|ele| ele == mark}
        end
    end

    def win_col?(mark)
        rotated = @grid.transpose
        rotated.any? do |row|
            row.all? {|ele| ele == mark}
        end
    end

    def win_diagonal?(mark)
        norm_arr = @grid.each_with_index.map { |row, i| row[i]}
        # return true if norm_arr.all? {|ele| ele == mark}

        reversed_arr = @grid.each_with_index.map { |row, i| row[-(i+1)] }
        # return true if reversed_arr.all? {|ele| ele == mark}

        norm_arr.all? {|ele| ele == mark} || reversed_arr.all? {|ele| ele == mark}
        # false
    end

    def win?(mark)
        return true if win_row?(mark)
        return true if win_col?(mark)
        return true if win_diagonal?(mark)
        false
    end

    def empty_positions?
        @grid.each do |row|
            return true if row.any? {|ele| ele == '_'}
        end
        false
    end

end

# b = Board.new
# b.place_mark([0,0], :X)
# b.place_mark([1,1], :X)
# b.place_mark([2,2], :X)
# b.place_mark([0,1], :X)
# b.place_mark([1,2], :X)
# b.place_mark([2,0], :X)
# b.place_mark([0,2], :X)
# b.place_mark([1,0], :X)
# b.place_mark([2,1], :X)
# b.print
# p b.win_diagonal?(:X)


