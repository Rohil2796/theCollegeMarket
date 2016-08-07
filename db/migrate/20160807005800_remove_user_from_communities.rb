class RemoveUserFromCommunities < ActiveRecord::Migration[5.0]
  def change
    remove_column :communities, :user_id, :integer
  end
end
