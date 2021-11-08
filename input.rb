class Input 
    attr_accessor :answer

    def read_answer!
        @answer = gets.chomp.to_i
    end
end