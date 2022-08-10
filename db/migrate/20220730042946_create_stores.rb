class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :map
      t.float :lat
      t.float :lng
      
      t.timestamps
    end
  end
end
