class Question < ApplicationRecord


  after_initialize :set_defaults

  def set_defaults
    puts "~~~~ Ran this model ~~~~~~"
  end

  belongs_to :user

end
