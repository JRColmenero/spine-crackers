class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :username
      t.string :profilePicture
      t.integer :userScore
      t.text :contQids
      t.timestamps
    end
  end
end

