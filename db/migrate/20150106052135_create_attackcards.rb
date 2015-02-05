class CreateAttackcards < ActiveRecord::Migration
  def change
    create_table :attackcards do |t|
      t.string :name
      t.integer :cost
      t.integer :damage
      t.text :description
      t.text :img

      t.timestamps null: false
    end
  end
end
