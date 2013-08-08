class ProductsController < ApplicationController

	def index
		@products = Product.all
		@order = Order.new
		@order.line_items.build  

	end

	def show
		@product = Product.find(params[:id])
		@order = Order.new		
		render :partial => "medias" 
	end
end
