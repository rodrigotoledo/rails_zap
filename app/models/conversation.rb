class Conversation < ApplicationRecord
  has_many :messages
  has_many :conversation_users
  has_many :users, through: :messages

  attr_accessor :last_message

  def last_messages(term = nil)
    last_messages = term.blank? ? self.messages : self.messages.where("message LIKE ?","%#{term}%")
    last_messages.order("created_at DESC").group("conversation_id").all
  end

  def last_message
    @last_message ||= messages.last
  end
end
