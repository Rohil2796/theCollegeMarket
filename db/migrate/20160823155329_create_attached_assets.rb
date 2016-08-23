class CreateAttachedAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :attached_assets do |t|
      t.string :caption
      t.integer :post_id

      t.timestamps
    end
  end
end
