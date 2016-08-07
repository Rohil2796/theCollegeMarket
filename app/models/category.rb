class Category < ApplicationRecord
	  has_and_belongs_to_many :posts, :join_table => "categories_posts", :association_foreign_key => "category_id", :foreign_key => "post_id"
	  enum itemservice: { item: 0, service: 1 }
end
