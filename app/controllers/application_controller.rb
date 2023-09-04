class ApplicationController < ActionController::Base
  include Exportable
  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "eve123"
    end
  end
end
