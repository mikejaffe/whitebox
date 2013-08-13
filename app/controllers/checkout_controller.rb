class CheckoutController < ApplicationController

before_filter :order_session_exists

	def edit
		@order = Order.find(session[:order])

	end

	def update
		@order = Order.find(session[:order])
		if @order.update_attributes(order_params)
			render :partial => "paypal"
		else
			render :text => 0
		end

	end


	def complete
		@order = Order.find(session[:order])
		if params[:cm].present?
			if params[:cm].eql?(session[:order])
				@order.update_attribute("status",params[:st])
				@order.update_attribute("paypal_result",params[:tx])
				session.delete(:order)
				OrderNotify.order_notification(@order).deliver
			end
		end 
		# @order = Order.find(params[:cm])
		# if params[:cm].present?
		# 	@order.update_attribute("status",params[:st])
		# 	@order.update_attribute("paypal_result",params[:tx])
		# 	session.delete(:order)
		# 	OrderNotify.order_notification(@order).deliver
		# end 
	end

	def pdt
		if params[:cm].present?
			order = Order.find(params[:cm])
			order.update_attributes("status",params[:st])
			order.update_attribute("paypal_result",params[:tx])
		end
	end

private
  	def order_session_exists
 		if session[:order].blank?
			redirect_to new_order_path
			return
		end
  	end


    def order_params
      params.require(:order).permit!
    end

end
