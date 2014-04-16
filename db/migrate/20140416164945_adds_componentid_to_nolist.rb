class AddsComponentidToNolist < ActiveRecord::Migration
  def change
    add_column :nolist, :component_id, :string
  end
end