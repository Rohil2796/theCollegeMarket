class AddUserToCommunity < ActiveRecord::Migration[5.0]
  def change
    add_reference :communities, :user, foreign_key: true
  end
end
