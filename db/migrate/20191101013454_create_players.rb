class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :user_id
      t.string :profile_picture
      t.integer :games_count
      t.integer :user_score
      t.text :quiz_q
      t.text :cont_q
      t.timestamps
    end
  end
end

