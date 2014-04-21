class AddComponentsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :component_ids, :string
  end
end
