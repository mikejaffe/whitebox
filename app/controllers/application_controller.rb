class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	private 
	def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        session[:admin] = true
        username ==  "whitebox" && password == "r36bnknerg398!"
      end
	end
end
