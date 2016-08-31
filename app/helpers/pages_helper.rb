module PagesHelper
	def feed
		Post.where("user_id = ?", id)
	end 
end
