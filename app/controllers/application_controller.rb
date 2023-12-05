class ApplicationController < ActionController::Base
  include CableReady::Broadcaster
  before_action :set_action_cable_identifier
  before_action :authenticate_user!
  protected

  def set_layout
    devise_controller? ? 'devise' : 'application'
  end

  def set_action_cable_identifier
    cookies.encrypted[:user_id] = current_user&.id
  end
end
