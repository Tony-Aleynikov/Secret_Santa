class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name)
    User.create(user_params)
    redirect_to root_path
  end

  def edit
    @user = current_user
  end

  def show
    @user = current_user
  end

  def update
    user_params = params.require(:user).permit(:name)
    current_user.update(user_params)
    redirect_to user_path
  end

  def destroy
    @user = current_user.destroy
    redirect_to root_path
  end

  def events
    @user = User.find(params[:id])
    @events = @user.events
  end

end
