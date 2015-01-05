class CreateGamestates < ActiveRecord::Migration
  def change
    create_table :gamestates do |t|

      t.timestamps null: false
    end
  end
end
