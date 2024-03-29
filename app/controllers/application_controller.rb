# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_current_request_details
  before_action :set_current_session
  before_action :authenticate

  private

  def authenticate
    redirect_to sign_in_path unless Current.session
  end

  def set_current_request_details
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
  end

  def set_current_session
    session = Session.find_by_id(cookies.signed[:session_token])
    Current.session = session if session
  end
end
