# frozen_string_literal: true

class MessageReflex < ApplicationReflex
  def conversation
    conversation = Conversation.find(element.dataset.conversation_id)
    morph '#messages', render(partial: 'home/messages', locals: {conversation: conversation})
  end

  def typing
    conversation = Conversation.find(element.dataset.conversation_id)
    user_to_receive = conversation.users.where.not(id: current_user.id).first
    if element.value.blank?
      last_message = conversation.messages.last
      Turbo::StreamsChannel.broadcast_update_to "last_messages_stream", target: "receiving_message_#{conversation.id}_#{user_to_receive.id}", partial: 'home/receiving_message', locals: {last_message: last_message}
    else
      Turbo::StreamsChannel.broadcast_update_to "last_messages_stream", target: "receiving_message_#{conversation.id}_#{user_to_receive.id}", html: 'escrevendo...'
    end
    morph nothing: true
  end
end
