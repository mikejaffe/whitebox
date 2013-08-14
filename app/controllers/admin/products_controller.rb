class Admin::ProductsController < ApplicationController
	layout "admin"
	before_filter :authenticate

	def index
		@products = Product.all.order(:name)
	end


	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			render :text => "success"
		else

			render :text => @product.errors.full_messages.join(","), :status => "500"
		end

	end

	private
	def product_params
      params.require(:product).permit!
    end

end
