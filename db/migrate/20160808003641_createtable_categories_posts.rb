class CreatetableCategoriesPosts < ActiveRecord::Migration[5.0]
 def change
  create_table :posts_categories, :id => false do |t|
  t.references :posts
     t.references :categories

    end
  end
end