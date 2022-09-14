class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    event_params = params.require(:event).permit(:name, :password)
    current_user.events.create(event_params)

    redirect_to user_path(current_user.id)
  end

  def show
    @event        = Event.find_by(id: params[:id])
    @id_for_santa = @event.relations.find_by(user_id: current_user.id).id_for_santa
    @party        = @event.users
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy

    redirect_to user_path(current_user.id) #TODO страница эвентов
  end

  def start
    event = Event.find_by(id: params[:id])
    event_relations = event.relations.shuffle
    event_relations.each_with_index do |relation, index|
      if event_relations[index+1].present?
        relation.update(id_for_santa: event_relations[index+1].user_id)
      else
        relation.update(id_for_santa: event_relations[0].user_id)
      end
    end

    redirect_to event_path(event)
  end

  def chat_for_santa
    @message           = Message.new
    @relation          = Relation.find_by(event_id: params[:id], user_id: current_user.id)
    @user_for_santa    = User.find(@relation.id_for_santa)
    message_from_santa = Message.where(event_id: params[:id], sender_id: current_user.id, recipient_id: @relation.id_for_santa)
    message_to_santa   = Message.where(event_id: params[:id], sender_id: @relation.id_for_santa, recipient_id: current_user.id)
    @messages          = (message_from_santa + message_to_santa).sort_by { |message| message.created_at }
  end

  def chat_with_santa
    @message           = Message.new
    @relation          = Relation.find_by(event_id: params[:id], id_for_santa: current_user.id )
    message_from_santa = Message.where(event_id: params[:id], sender_id: @relation.user_id, recipient_id: current_user.id)
    message_to_santa   = Message.where(event_id: params[:id], sender_id: current_user.id, recipient_id: @relation.user_id)
    @messages          = (message_from_santa + message_to_santa).sort_by { |message| message.created_at }
  end
end
