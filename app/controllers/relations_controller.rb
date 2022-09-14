class RelationsController < ApplicationController
  def new
    @relation = Relation.new
  end

  def create
    event_params = params.require(:relation).permit(:name, :password)
    event = Event.find_by(name: event_params[:name], password: event_params[:password])
    if event.present?
      Relation.create(user_id: current_user.id, event_id: event.id)

      redirect_to root_path
    else
      render :new
    end
  end
end
