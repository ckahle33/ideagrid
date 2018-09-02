class MessagesController < ApplicationController
  def index
    @inbox = current_user.inbox_messages
    @outbox = current_user.outbox_messages
  end

  def show
    @reply = Message.new
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    user_id = User.find_by(email: message_params[:user]).id
    #sloppy, should be a js typeahead that inserts id from front-end
    message = Message.new(
      subject: message_params[:subject],
      body: message_params[:body],
      recipient_id: user_id,
      sender_id:  current_user.id,
      parent_id: message_params[:parent_id].to_i,
    )
    if message.save!
      redirect_to message_path(message.parent.id)
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
