class MessagesJob < ApplicationJob
  queue_as :default

  def perform(message)
    Turbo::StreamsChannel.broadcast_update_to("messages",
      target: 'messages',
      partial: 'messages/messages',
      locals: {
        conversation: message.conversation,
        current_user: message.user
      })
  end
end
