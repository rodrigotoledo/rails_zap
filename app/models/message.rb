class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  after_create_commit { broadcast_append_to "divs", target: "append_outside_of_me" }
end
