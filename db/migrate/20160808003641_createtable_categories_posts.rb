class CreatetableCategoriesPosts < ActiveRecord::Migration[5.0]
 def change
  create_table :categories_posts, :id => false do |t|
 t.integer :category_id
      t.integer :post_id
    end
  end
end