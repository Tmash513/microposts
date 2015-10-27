class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update,]
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path , notice: '編集を保存しました'
    else
      render 'setting'
    end
  end
  
  def show
    @user = User.find(params[:id])
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
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :location, :website, :bio, :password, :password_confirmation)
  end
    
end
