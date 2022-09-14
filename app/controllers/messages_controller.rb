class MessagesController < ApplicationController

  def create
    message_params = params.require(:message).permit(:body, :event_id, :sender_id, :recipient_id)
    Message.create(message_params)

    if params[:message][:whose_chat] == "santa"
      redirect_to "/events/#{params[:message][:event_id]}/chat_for_santa"
    elsif params[:message][:whose_chat] == "no santa"
      redirect_to "/events/#{params[:message][:event_id]}/chat_with_santa"
    end
  end
end
