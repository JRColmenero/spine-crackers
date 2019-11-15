class PlayerController < ApplicationController
  
  def index
  end

  def show    
  end

  def update
  end

  def new
    @player = Player.new    
  end

  def create
    @player = Player.create(player_params)    
  end

  private

  def player_params
    params.require(:player).permit(:username, :profilePicture, :gamesplayed, :userScore, :quizQids, :contQids)
  end


end
