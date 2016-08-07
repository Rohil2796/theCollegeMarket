class AddStatusToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :status, :integer, default: 0, 
    add_column :posts, :offerrequest, :integer, default: 0,
    add_column :posts, :posttype, :integer, default: 0
  end
end
