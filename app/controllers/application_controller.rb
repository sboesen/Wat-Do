class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include ApplicationHelper
  Time.zone = "Pacific Time (US & Canada)"
end
