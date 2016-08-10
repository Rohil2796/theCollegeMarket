class Category < ApplicationRecord
	  has_many :posts
	  enum itemservice: { item: 0, service: 1 }

	  def category_tooltip
	  	self.description
	  end



end
