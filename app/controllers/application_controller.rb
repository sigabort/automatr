class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  #Don't log the passwords in the logs
  filter_parameter_logging :password
end
