class MessagesController < ApplicationController
  before_action :set_conversation
  def create
    message = @conversation.messages.build(message_params)
    message.user_id = current_user.id
    message.save!
    
    head :ok
  end

  def index
    render turbo_stream: turbo_stream.update("messages_#{@conversation.id}_#{current_user.id}", partial: "messages/messages",locals: {conversation: @conversation, current_user: current_user})
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
