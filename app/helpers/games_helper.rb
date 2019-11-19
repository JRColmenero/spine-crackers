module GamesHelper

  def generate_game

      count = 0
      temp_q = nil
      @quiz_questions = []

      until count == 10   # Loop until ten questions have been added to the array.
        count += 1
        
        temp_q = rand(1..Question.count) # Pick a random number between 1 and the total amount of questions in the database.       

        if Question.find(temp_q).book_name == nil # If there is nil value for book name 
          Question.find(temp_q).destroy           # Delete the record and subtract one from the count.
          count -= 1
          puts "NIL RECORD"
        else
          if @quiz_questions.index(['X', temp_q]) == nil  # If the random ID is nil, push into array.
            @quiz_questions.push(['X', temp_q])           # Nil signifies that it is not a duplicate question.
            puts @quiz_questions.inspect
          else
            count -= 1 # If duplicate subtract 1 from the counter and rerun
            puts "DUPLICATE"
          end
        end

      end

    end

end
