class Quiz
    
    def initialize 
        @num1 =rand(1...20)
        @num2 =rand(1...20)
    end
    
    def to_s
        "What does #{@num1} + #{@num2} equal?"
    end
    
    def correct_answer?(answer)
        @num1 + @num2 == answer
    end

end