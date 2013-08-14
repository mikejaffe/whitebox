class Admin::OrdersController < ApplicationController
	layout "admin"
	before_filter :authenticate
	def index
		@orders = Order.where("status <> 'cart'").order("id desc").paginate(:per_page => 50, :page=> params[:page])
		respond_to do |format|
			format.html
			format.csv { 
				orders = Order.where("status <> 'cart'").order("id desc")
				send_data orders.as_csv
			}
		end
	end




end
