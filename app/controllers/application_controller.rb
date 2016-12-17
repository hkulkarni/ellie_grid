class ApplicationController < ActionController::Base
  # Note: This is BAD! We are disabling cross site scripting protection for now.
  protect_from_forgery with: :null_session
end
