class ApplicationController < ActionController::Base
  before_action :check_login
  helper_method :current_user
  private

  def current_user
    @currenr_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def check_login
    unless session[:user_id].present?
      redirect_to root_path
    end
  end
end
