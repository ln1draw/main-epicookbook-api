class AddsNameToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :name, :string
  end
end
