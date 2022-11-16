class Player
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        entry = gets.chomp
        position = [entry[0].to_i, entry[2].to_i]
    end
end
