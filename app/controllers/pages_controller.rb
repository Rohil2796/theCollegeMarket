class PagesController < ApplicationController
  before_filter :post 
  def about
  end

 def home
    if logged_in?
      @post  = current_user.post.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      
    end
  end

  def hello
  end 

  def contact
  end 
 def post
   @post = Post.find(params[:id])
   @attached_photos = @post.attached_assets.order('post_id ASC').take(1)
  end
  
end
