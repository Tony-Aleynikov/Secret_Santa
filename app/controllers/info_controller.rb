class InfoController < ApplicationController
  skip_before_action :check_login
  def index
    @user = current_user
  end
end
