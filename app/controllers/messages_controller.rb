class MessagesController < ApplicationController
  before_action :set_conversation
  def create
    message = @conversation.messages.build(message_params)
    message.user_id = current_user.id
    message.save!
    render turbo_stream: turbo_stream.preppend("messages", partial: "messages/messages",locals: {conversation: @conversation})
  end

  def index
    @messages = @conversation.messages
    render turbo_stream: turbo_stream.update("messages", partial: "messages/messages",locals: {conversation: @conversation})
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
