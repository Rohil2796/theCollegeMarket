class AddIndextoPosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :user_id, :type, :integer, 
  	add_foreign_key :posts, :users, column: :author_id
  end
end
