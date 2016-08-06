class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.boolean :free
      t.decimal :price
      t.boolean :obo
      t.date :expiredate
      t.string :tix_eventname
      t.date :tix_eventdate
      t.string :tb_classname
      t.integer :tb_classnumber
      t.integer :tb_edition

      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
    add_index :posts, :expiredate
    add_index :posts, [:user_id, :created_at]
  end
end
