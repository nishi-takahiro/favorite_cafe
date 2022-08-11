class RemoveMapFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :map, :string
  end
end
