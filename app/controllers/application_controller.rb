class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :js_request?

  private

  def js_request?
    request.format.js?
  end
end
