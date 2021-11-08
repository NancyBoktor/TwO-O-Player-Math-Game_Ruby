require_relative 'quiz'
require_relative 'player'
require_relative 'input'


class Game 
    def initialize
        @players = [Player.new("1"),Player.new("2")]
    end

    def display_score
        sorted_players = @players.sort_by{|player| player.name}
        puts " P#{sorted_players[0].name}: #{sorted_players[0].score_tracker} vs P#{sorted_players[1].name}: #{sorted_players[1].score_tracker}"
    end

    def current_player
        @players[0]
    end

    def other_player
        @players[1]
    end

    def next_player_turn
        @players = @players.rotate(-1)
    end

    def start
        while (current_player.score != 0 && other_player.score != 0) do
            
            @quiz = Quiz.new
            puts "player #{current_player.name}: #{@quiz}"

            response = Input.new
            response.read_answer!
            result = @quiz.correct_answer?(response.answer)
            if result
                puts "YES! You are correct."  
                self.display_score
                puts "---- NEW TURN ----"
                self.next_player_turn
            else
                puts "Seriously? No!"
                current_player.score -= 1
                self.display_score
                puts "---- NEW TURN ----"
                self.next_player_turn
            end
        end
        
    winner = @players.sort_by{|player| player.score}.last
    puts "P#{winner.name} wins with score of #{winner.score_tracker}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
    end
end
g = Game.new
puts g.start