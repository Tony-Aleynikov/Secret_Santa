class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name)

    User.create(user_params)

    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
    @user = User.find(params[:id]).destroy

    redirect_to root_path
  end
end
