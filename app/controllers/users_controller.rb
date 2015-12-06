class UsersController < ApplicationController
before_action :set_user, only:[:show, :index]

  def show
  	@posts = Post.where(user_id: current_user.id)
  	@most_recent = Post.where(user_id: current_user.id).last
    @counter = 0
    @like_size = 0
    @posts.each do |post|
     @counter += post.comments.size 
     @like_size += post.get_likes.size
    
  	end
  end

  def index
  @users = User.search(params[:search])
 redirect_to post_path(@post)
end

private

def set_user
  @user = User.find_by(name: params[:id])
end

def user_params
  params.require(:user).permit(:avatar, :name, :title, :link, :description, :image)
end

  def only_current_user
        @user = User.find(params[:user_id])
        redirect_to(root_url) unless @user == current_user
    end
end
