class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    redirect_to "/games/userpage"
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    redirect_to '/games/userpage'
  end

  private

  def question_params
    params.require(:question).permit(:user_id, :book_name, :author_name, :question, :correct_answer, :wrong_answer_1, :wrong_answer_2, :wrong_answer_3)
  end

end