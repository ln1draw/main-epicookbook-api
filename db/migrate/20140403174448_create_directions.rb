class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.integer :recipe_id
      t.text :content

      t.timestamps
    end
  end
end
