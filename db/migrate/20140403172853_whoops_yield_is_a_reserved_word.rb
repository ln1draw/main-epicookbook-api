class WhoopsYieldIsAReservedWord < ActiveRecord::Migration
  def change
    remove_column :recipes, :yield
    add_column :recipes, :makes, :string
  end
end
