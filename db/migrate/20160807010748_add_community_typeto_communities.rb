class AddCommunityTypetoCommunities < ActiveRecord::Migration[5.0]
  def change
  	    add_column :communities, :communitytype, :integer
  end
end
