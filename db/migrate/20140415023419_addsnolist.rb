class Addsnolist < ActiveRecord::Migration
  def change
    create_table :nolist do |t|
      t.string :name
      t.string :uid

      t.timestamps
    end

    create_table :component_list do |t|
      t.integer :nolist_id
      t.integer :apid
      t.string :name
    end
  end
end
