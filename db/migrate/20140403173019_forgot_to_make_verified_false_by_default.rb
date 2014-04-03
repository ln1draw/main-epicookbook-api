class ForgotToMakeVerifiedFalseByDefault < ActiveRecord::Migration
  def change
    remove_column :recipes, :verified
    add_column :recipes, :verified, :boolean, default: false
  end
end
