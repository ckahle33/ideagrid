class MessagesController < ApplicationController
  def index
    @inbox = current_user.inbox_messages
    @inbox = current_user.outbox_messages
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    message = Message.new(message_params)
    if message.save!
      redirect_to messages_path
      flash[:success] = "Message sent"
    else
      redirect_to messages_path
      flash[:danger] = "Error sending message."
    end
  end

  private

  def message_params
    params.require(:message).permit!
  end

end
