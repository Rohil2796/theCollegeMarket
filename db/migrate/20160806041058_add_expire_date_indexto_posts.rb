class AddExpireDateIndextoPosts < ActiveRecord::Migration[5.0]
  def change
  	add_index :posts, :expiredate
    end
end
