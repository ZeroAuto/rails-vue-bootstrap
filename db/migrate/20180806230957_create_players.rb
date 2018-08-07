class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :game
      t.integer :rating
      t.integer :balance
      t.integer :winnings

      t.timestamps
    end
  end
end
