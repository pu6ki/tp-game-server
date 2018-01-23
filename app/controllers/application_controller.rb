class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, if: :js_request?
  skip_before_action :verify_authenticity_token, if: :json_request?  

  private

  def js_request?
    request.format.js?
  end

  def json_request?
    request.format.json?
  end
end
