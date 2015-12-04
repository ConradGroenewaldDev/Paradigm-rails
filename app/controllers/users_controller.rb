class UsersController < ApplicationController
before_action :set_user, only:[:show]

  def show
  end

  def index
 redirect_to post_path(@post)
end

private

def set_user
  @user = User.find_by(name: params[:id])
end

def user_params
  params.require(:user).permit(:avatar)
end

  def only_current_user
        @user = User.find(params[:user_id])
        redirect_to(root_url) unless @user == current_user
    end
end
