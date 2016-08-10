class DropTablePostsCategories < ActiveRecord::Migration[5.0]
  def change
  	drop_table :posts_categories
  end
end
