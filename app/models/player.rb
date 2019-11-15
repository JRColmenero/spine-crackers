class Player < ApplicationRecord
  
  after_initialize :set_defaults

  def set_defaults
    if self.games_count == nil
      self.profile_picture = "xxx.jpg"
      self.games_count = 0
      self.user_score = 0
      self.quiz_q = []
      self.cont_q =[]
    end
  end

  belongs_to :user

end
