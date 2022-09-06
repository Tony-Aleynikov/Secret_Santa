class SessionsController < ApplicationController
  skip_before_action :check_login, only: %i[new create]
  def new
  end

  def create
    user_params = params.require(:session)
    user = User.find_by(name: user_params[:name])
    if user.present?
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
