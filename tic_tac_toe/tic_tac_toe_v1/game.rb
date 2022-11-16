class Game
    attr_reader :player_1_mark, :player_2_mark
    attr_writer :current_player

    def initialize(player_1_mark, player_2_mark)
        @player_1_mark = player_1_mark
        @player_2_mark = player_2_mark
        @current_player
    end



end