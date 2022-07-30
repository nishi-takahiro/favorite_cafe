class CreateTagIntermediates < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_intermediates do |t|
      t.integer :article_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
