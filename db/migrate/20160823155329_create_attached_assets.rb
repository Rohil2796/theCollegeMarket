class CreateAttachedAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :attached_assets do |t|
      t.caption :string
      t.post_id :integer

      t.timestamps
    end
  end
end
