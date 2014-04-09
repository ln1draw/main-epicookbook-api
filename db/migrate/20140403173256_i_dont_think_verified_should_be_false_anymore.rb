class IDontThinkVerifiedShouldBeFalseAnymore < ActiveRecord::Migration
  def change
    remove_column :recipes, :verified
    add_column :recipes, :verified, :boolean
  end
end
