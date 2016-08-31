class PagesController < ApplicationController
  def about
  end

 def home
    if logged_in?
      @post = Post.find(params[:id])
      @feed_items = current_user.feed.paginate(page: params[:page])
      @attached_photos = @post.attached_assets.order('post_id ASC').take(1)
    end
  end

  def hello
  end 

  def contact
  end 

  
end
