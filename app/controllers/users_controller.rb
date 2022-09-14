class UsersController < ApplicationController
  skip_before_action :check_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name)
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def edit

  end

  def show
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
    @user = current_user
    @events = @user.events
  end
end
