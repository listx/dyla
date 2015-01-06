class CreateGamestates < ActiveRecord::Migration
  def change
    create_table :gamestates do |t|
      t.integer :victory_points
      t.integer :tech_points
      t.integer :hit_points
      t.integer :enemy_deck
      # a string to hold all cards in your hand, deck, and discard
      # "1 12 3 4 15 6 20 8" --> [1,12,3,4,15,6,20,8] for Ruby
      t.text :hand
      t.text :my_deck
      t.text :discard
      t.integer :turn_phase
      t.integer :turns
      t.timestamps null: false
    end
  end
end
