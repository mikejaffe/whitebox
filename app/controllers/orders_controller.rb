class OrdersController < ApplicationController
	before_filter :order_session_exists, :except => [:create,:new]

	def new
		@products = Product.all
		@order = Order.new
		@order.line_items.build  

	end


	def create
		@order = Order.new(order_params)
		if @order.valid?
			@order.save
			@order.line_items[0].medias << Media.create(params[:medias])
			session[:order] = @order.id
			redirect_to order_path(@order)
		end
	end

	def show
		@order = Order.find(session[:order])
	end


	def update
		@order = Order.find(session[:order])
		@order.update_attributes(order_params)
		if params[:medias].present?
			@order.line_items[0].medias.destroy
			@order.line_items[0].medias << Media.create(params[:medias])
		end
		render :show
	end


  private
 
  	def order_session_exists
 		if session[:order].blank?
			redirect_to new_order_path
			return
		end
  	end

    def order_params
      params.require(:order).permit(:ad_url,:ad_mailto,:ad_start_date,:ad_end_date,:ad_run_days,:total_cost,:line_items,:line_items_attributes => [:id,:product_id])
    end


end
