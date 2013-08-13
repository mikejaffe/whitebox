class OrderNotify < ActionMailer::Base
  default from: "orders@redbankgreen.com"

  def order_notification(order)
  		@order = order
  		mail(to: "whitebox@redbankgreen.com", subject: "New Whitebox Order #{order.order_number}")
  end
end
