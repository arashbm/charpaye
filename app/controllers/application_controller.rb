require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json

  def user_root_path
    dashboard_path
  end

  protect_from_forgery
end
