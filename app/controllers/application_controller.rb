class ApplicationController < ActionController::Base
  include CableReady::Broadcaster
  before_action :authenticate_user!

  def set_layout
  end

  protected

  def set_layout
    devise_controller? ? 'devise' : 'application'
  end
end
