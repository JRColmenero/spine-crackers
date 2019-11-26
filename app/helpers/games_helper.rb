module GamesHelper

  def generate_game

    count = 0
    rand_id = nil
    @quiz_questions = []

    until count == 11   # Loop until ten questions have been added to the array.
      count += 1
      
      rand_id = rand(1..Question.last.id) # Pick a random number between 1 and the total amount of questions in the database.       

      if Question.exists?(rand_id) != true
        count -= 1
        puts "BLANK RECORD"
      elsif Question.find(rand_id).book_name == nil # If there is nil value for book name 
          Question.find(rand_id).destroy            # Delete the record and subtract one from the count.
          count -= 1
          puts "NIL RECORD"
      elsif @quiz_questions.index(['X', rand_id]) == nil  # If the random ID is nil, push into array.
          @quiz_questions.push(['X', rand_id])            # Nil signifies that it is not a duplicate question.
          puts @quiz_questions.inspect
      else
        count -= 1 # If duplicate subtract 1 from the counter and rerun
        puts "DUPLICATE"
      end
    end

    Player.update(current_user.player.user_id, :quiz_q => @quiz_questions) # Save 10 Question Quiz into Player Record

  end

  def lets_play

    @score = 0
    @level = 0

    Player.find(current_user.id).quiz_q.each do |next_question_id|  # "Loop" through Game Array    

      @level += 1                       # Count to Current Level

      if next_question_id[0] == "X"     # Find Next Question not played. "X" status means not played.
        @qid = next_question_id[1]      # Store Question ID to @qid
        break                           # Stop Loop

      elsif next_question_id[0] == "A"
        @score +=1                      # Count Correct Answers/Score      
      
      end

      @last_question = next_question_id[1]
      @last_question_status = next_question_id[0]                

    end

  end

end
