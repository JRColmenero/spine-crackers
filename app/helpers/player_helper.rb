module PlayerHelper

  def plus_one
    Player.update(current_user.player.user_id, :user_score => current_user.player.user_score += 1)
  end

end
