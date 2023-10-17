class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  after_create_commit :broadcast_to_conversation

  def broadcast_to_conversation
    form_frame_id = "form_message_#{conversation.id}_#{user.id}"
    frame_id = "messages_#{conversation.id}"


    broadcast_append_to "messages_stream", target: frame_id, partial: 'messages/message', locals: {message: self, current_user: self.user}
    broadcast_update_to "messages_stream", target: form_frame_id, partial: 'messages/form', locals: {conversation_id: conversation.id}
    conversation.users.each do |conversation_user|
      Turbo::StreamsChannel.broadcast_update_to "last_messages_stream", target: "receiving_message_#{conversation.id}_#{conversation_user.id}", partial: 'home/receiving_message', locals: {last_message: self}
    end
  end
end
