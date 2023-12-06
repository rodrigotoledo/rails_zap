module HomeHelper
  def user_in_message(conversation, current_user)
    @user_in_message ||= conversation.conversation_users.where("user_id != ?", current_user.id).first
  end
end
