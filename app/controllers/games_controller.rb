class GamesController < ApplicationController
  
  def index
  end

  def userpage
  end

  def quiz
  end

  def correct_answer
    puts "~~~~~~CORRECT ANSWER~~~~~~"

    game_array = Player.find(current_user.id).quiz_q

    game_array.each_with_index do |next_question_id, index_id|

      

      if next_question_id[0] == "X"                               # Find Current Question
        game_array[index_id] = ["A", next_question_id[1]]         # Replace X with A
        Player.find(current_user.id).update(quiz_q: game_array)   # Store to database
        
        if index_id == 9
          game_end
          break
        else
          redirect_to "/games/quiz"
          break
        end

      end
    end

    
  end

  def wrong_answer
    puts "~~~~~~WRONG ANSWER~~~~~~~~"

    game_array = Player.find(current_user.id).quiz_q

    game_array.each_with_index do |next_question_id, index_id|  # "Loop" through Game Array    

      if index_id >= 9
        game_end
        break
      end

      if next_question_id[0] == "X"
        game_array[index_id] = ["F", next_question_id[1]]
        Player.find(current_user.id).update(quiz_q: game_array)
        
        if index_id == 9
          game_end
          break
        else
          redirect_to "/games/quiz"
          break
        end

      end
    end

    
  end


  def game_end

    @score = 0

    Player.find(current_user.id).quiz_q.each do |next_question_id|  # "Loop" through Game Array    

      if next_question_id[0] == "A"
        @score +=1                      # Count Correct Answers/Score
      end
    end

    puts "~~~~~~~~~~~~ RAN THIS EXIT ~~~~~~~~~~~~"
    @score = Player.find(current_user.id).user_score + @score
    Player.update(current_user.player.user_id, :user_score => @score)

    @games_played = Player.find(current_user.id).games_count + 1
    Player.update(current_user.player.user_id, :games_count => @games_played)



    redirect_to "/games/userpage"

  end


end
