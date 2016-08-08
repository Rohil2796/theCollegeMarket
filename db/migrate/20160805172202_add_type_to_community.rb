class AddTypeToCommunity < ActiveRecord::Migration[5.0]
  def change
    add_column :communities, :communitytype, :integer, default: 0, index: true
  end
end
