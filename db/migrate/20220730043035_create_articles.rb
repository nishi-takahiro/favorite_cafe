class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :store_id
      t.integer :user_id
      t.integer :tag_intermediate
      t.string :store_name
      t.string :address
      t.string :store_image_id
      t.text :store_comment
      t.float :rate_delicious, null: false, default: 0
      t.float :rate_atmospher, null: false, default: 0
      t.float :rate_cost, null: false, default: 0

      t.timestamps
    end
  end
end
