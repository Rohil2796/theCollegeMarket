class AddPictureToTbposts < ActiveRecord::Migration[5.0]
  def change
    add_column :tbposts, :picture, :string
  end
end
