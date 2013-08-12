class AdminController < ApplicationController
	before_filter :authenticate
	def index
		@orders = Order.where("status <> 'cart'").order("id desc")

	end


	private 
	def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        session[:admin] = true
        username ==  "whitebox" && password == "r36bnknerg398!"
      end
	end
end
