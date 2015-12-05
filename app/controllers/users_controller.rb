class UsersController < ApplicationController
before_action :set_user, only:[:show, :index]

  def show
  	@posts = Post.where(user_id: current_user.id)
  	@most_recent = Post.where(user_id: current_user.id).last
  	@profile_comment_count = Post.comments.find(:all, :conditions => ["user_id = ?", current_user.id]).size

  end

  def index
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
