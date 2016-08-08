class Category < ApplicationRecord
	  has_and_belongs_to_many :posts, :join_table => "posts_categories", :association_foreign_key => "posts_id", :foreign_key => "categories_id"
	  accepts_nested_attributes_for :posts
	  enum itemservice: { item: 0, service: 1 }
end
