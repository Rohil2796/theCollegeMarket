class PostsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]
before_action :correct_user,   only: :destroy

def show
   @post = Post.find(params[:id])
   @attached_photos = @post.attached_assets.order('post_id ASC').take(1)
end

def new
   @post = Post.new
end

def edit
  @post = Post.find(params[:id])
end

def create
  @post = current_user.post.build(post_params)
  if @post.save
    flash[:success] = "Post(s) successfully created!"
    redirect_to root_url
  else
    render 'new'
  end
end

  def update
      @post = Post.find(params[:id])
      if @post.update_attributes(post_params)
        flash[:success] = "Post updated"
        redirect_to @post
      else
        render 'edit'
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
      :tb_classname, :tb_classnumber, :offerrequest, :posttype, :category, :category_id, attached_assets_attributes: [:id, :asset, :category, :_destroy])
    end

    def correct_user
      @post = current_user.post.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end

 