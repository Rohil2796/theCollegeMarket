class CreateTbPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :tb_posts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
	end
    add_index :tb_posts, [:user_id, :created_at]
  end
end
