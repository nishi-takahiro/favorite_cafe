class AddArticlesToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :store_address, :string
  end
end
