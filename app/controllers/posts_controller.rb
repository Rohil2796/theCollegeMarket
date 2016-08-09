class PostsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]
before_action :correct_user,   only: :destroy

def show
   @post = Post.find(params[:id])
   @post_attachments = @post.post_attachments.all
end

def new
   @post = Post.new
   @post_attachment = @post.post_attachments.build
end

def create
  @post = current_user.post.build(post_params)
  if @post.save
    if !@post_attachment.nil? && params[:post_attachments]['avatar'].each do |a|
        @post_attachment = @post.post_attachments.create!(:avatar => a)
    end
    end
    flash[:success] = "Post(s) successfully created!"
    redirect_to root_url
  else
    render 'new'
  end
end


  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit(:name, :free, :price, :obo, :expiredate, :tix_eventname, :tix_eventdate, 
      :tb_classname, :tb_classnumber, :offerrequest, :posttype, categories: [], category: [], category_id: [], categories_id: [], post_attachments_attributes: [:id, :post_id, :avatar])
    end

    def correct_user
      @post = current_user.post.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end

 