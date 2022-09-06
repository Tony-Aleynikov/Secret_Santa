class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    event_params = params.require(:event).permit(:name, :password)
    current_user.events.create(event_params)

    redirect_to user_path(current_user.id)
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy

    redirect_to user_path(current_user.id) #TODO страница эвентов
  end

end
