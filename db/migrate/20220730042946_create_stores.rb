class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :address
      t.string :map
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
  end
end
