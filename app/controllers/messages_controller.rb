class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user_id = current_user.id
    message.save!
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:conversation_id, :message)
  end
end
