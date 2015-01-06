class CreateAttackcards < ActiveRecord::Migration
  def change
    create_table :attackcards do |t|
      t.string :name
      t.integer :cost
      t.integer :damage
      t.text :description

      t.timestamps null: false
    end
  end
end
