class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :ID
      t.string :username
      t.string :bookName
      t.string :authorName
      t.string :questions
      t.string :correctAnswer
      t.string :wrongAnswer1
      t.string :wrongAnswer2
      t.string :wrongAnswer3
      t.timestamps
    end
  end
end
