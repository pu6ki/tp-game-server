class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: proc { js_request? || json_request? }

  private

  def js_request?
    request.format.js?
  end

  def json_request?
    request.format.json?
  end
end
