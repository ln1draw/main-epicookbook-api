class FixesTableNAmes < ActiveRecord::Migration
  def change
    rename_table :nolist, :nolists
    rename_table :component_list, :component_lists
  end
end
