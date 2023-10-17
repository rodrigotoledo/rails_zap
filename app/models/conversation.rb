class Conversation < ApplicationRecord
  has_many :messages
  has_many :conversation_users
  has_many :users, through: :messages

  attr_accessor :last_message

  def last_messages(term = nil)
    last_messages = messages.order("created_at DESC")
    last_messages = messages.where("message LIKE ?","%#{term}%") unless term.blank?
    last_messages.group("conversation_id")
  end

  def last_message
    @last_message ||= messages.last
  end
end
