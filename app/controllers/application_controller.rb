class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  


  
   rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

 def post
   @post = Post.find(params[:id])
   @attached_photos = @post.attached_assets.order('post_id ASC').take(1)
  end


  private
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  helper_method :mailbox
  

end