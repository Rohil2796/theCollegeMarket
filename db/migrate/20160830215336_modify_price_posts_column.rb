class ModifyPricePostsColumn < ActiveRecord::Migration[5.0]
  def change
  	change_column :posts, :price, :integer, :default => 0, :null => false
end
