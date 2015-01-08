class CreateEnemycards < ActiveRecord::Migration
  def change
    create_table :enemycards do |t|
      t.integer :lvl
      t.string :name
      t.integer :damage
      t.integer :hp
      t.integer :vp
      t.integer :tp
      t.text :description

      t.timestamps null: false
    end
  end
end
