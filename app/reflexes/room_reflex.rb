# frozen_string_literal: true

class RoomReflex < ApplicationReflex
  def search
    last_messages = []
    current_user.conversations.each do |conversation|
      last_messages << conversation.last_messages(element.value)
    end

    conversations = Conversation.where(id: last_messages.map{|t| t.try(:conversation_id)})
    morph '#last_messages', render(partial: 'home/last_messages', locals: {conversations: conversations})
  end
end
