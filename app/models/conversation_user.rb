class ConversationUser < ApplicationRecord
  self.table_name = "conversations_users"
  belongs_to :user
  belongs_to :conversation
end
