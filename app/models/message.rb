class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  after_save :schedule_job
  before_destroy :schedule_job

  def schedule_job
    MessagesJob.perform_later(self)
  end
end
