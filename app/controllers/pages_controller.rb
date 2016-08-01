class PagesController < ApplicationController
  def about
  end

 def home
    if logged_in?
      @tbpost  = current_user.tbpost.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def hello
  end 

  def contact
  end 

end
