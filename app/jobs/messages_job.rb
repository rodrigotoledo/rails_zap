class MessagesJob < ApplicationJob
  queue_as :default

  def perform(message)
    user_to_receive = message.conversation.users.where.not(id: message.user.id).first
    Turbo::StreamsChannel.broadcast_update_to("messages",
      target: "messages_#{message.conversation_id}_#{user_to_receive.id}",
      partial: 'messages/messages',
      locals: {
        conversation: message.conversation,
        current_user: user_to_receive
      })

    Turbo::StreamsChannel.broadcast_update_to("messages",
      target: "messages_#{message.conversation_id}_#{message.user.id}",
      partial: 'messages/messages',
      locals: {
        conversation: message.conversation,
        current_user: message.user
      })
  end
end
