class Community < ApplicationRecord
	has_many :users
	has_many :posts, through: :users

	enum community_type: { university: 0, company: 1, neighborhood: 2 }
	
	def get_community_id
end
