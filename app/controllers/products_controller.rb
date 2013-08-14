class ProductsController < ApplicationController

	def index
		@products = Product.all
		@order = Order.new
		@order.line_items.build  

	end

	def show
		@order =  !session[:order].present? ? Order.new	 : Order.find(session[:order])
		@product = !session[:order].present? ? Product.find(params[:id]) : @order.line_items[0].product
	 	if @product.id != params[:id].to_i
	 		@order = Order.new
	 		@product = Product.find(params[:id])
	 	end
		render :partial => "medias" 
	end
end
