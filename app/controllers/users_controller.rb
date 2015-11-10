class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :followings, :followers]
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path , notice: '編集を保存しました'
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def followings
    @title = "Following"
    @user = User.find(params[:id])
    @followings = @user.following_users
    render 'followings'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @followers = @user.follower_users
    render 'followers'
  end
  
  # kaminariの実装
#  def index
#    @users = User.page(params[:page]).per(10).order(:id)
#  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :location, :website, :bio, :password, :password_confirmation)
  end
    
end
