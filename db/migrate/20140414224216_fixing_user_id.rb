class FixingUserId < ActiveRecord::Migration
  def change
    remove_column :recipes, :user_id
    add_column :recipes, :uid, :string
  end
end
