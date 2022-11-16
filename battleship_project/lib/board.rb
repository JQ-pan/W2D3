class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n 
    end

    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        count = 0
        @grid.each {|subArr| subArr.each {|ele| count += 1 if ele == :S}}
        count
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts "you sunk my battleship!"
            true
        else
            self[position] = :X
            false
        end
    end

    def place_random_ships
        max_ships = @size / 4
        len = @grid.length

        count = 0

        while count < max_ships
            row = rand(0...len)
            col = rand(0...len)
            pos = [row, col]
            if self[pos] != :S 
                count += 1
                self[pos] = :S 
            end
        end

    end

    def hidden_ships_grid
        hidden_grid = Marshal.load(Marshal.dump(@grid))

        @grid.each_with_index do |sub_arr, x|
            sub_arr.each_with_index do |ele, y|
                if ele == :S
                    hidden_grid[x][y] = :N 
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(grid)
        grid.each {|row| puts row.join(" ") }
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
