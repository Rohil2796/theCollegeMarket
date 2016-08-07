class RemoveTypeFromCommunity < ActiveRecord::Migration[5.0]
  def change
    remove_column :communities, :type, :integer
  end
end
