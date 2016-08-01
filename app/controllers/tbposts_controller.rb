class TbpostsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]
before_action :correct_user,   only: :destroy

 def create
    @tbpost = current_user.tbposts.build(tbpost_params)
    if @tbpost.save
      flash[:success] = "Textbook Post created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @tbpost.destroy
    flash[:success] = "Textbook Post deleted"
    redirect_to request.referrer || root_url
  end

  private

    def tbpost_params
      params.require(:tbpost).permit(:content)
    end

    def correct_user
      @tbpost = current_user.tbpost.find_by(id: params[:id])
      redirect_to root_url if @tbpost.nil?
    end
end