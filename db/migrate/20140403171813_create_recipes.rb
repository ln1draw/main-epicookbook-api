class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.boolean :verified
      t.string :yield
      t.string :blurb
      t.string :image
      t.integer :user_id
      t.integer :prep_time
      t.integer :inactive_time

      t.timestamps
    end
  end
end
