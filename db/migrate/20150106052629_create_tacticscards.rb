class CreateTacticscards < ActiveRecord::Migration
  def change
    create_table :tacticscards do |t|
      t.string :name
      t.integer :cost
      t.text :description

      t.timestamps null: false
    end
  end
end
