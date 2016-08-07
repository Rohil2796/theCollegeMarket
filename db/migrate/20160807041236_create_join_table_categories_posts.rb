class CreateJoinTableCategoriesPosts < ActiveRecord::Migration[5.0]
  def change
  create_table :categoriesposts, :id => false do |t|
  t.references :categories, :null => false
  t.references :posts, :null => false
end
  end
end




# Adding the index can massively speed up join tables. Don't use the
# unique if you allow duplicates.
