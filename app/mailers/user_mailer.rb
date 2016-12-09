class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(user, order, line_items)
    @user = user
    @order = order
    @line_items = line_items
    @url  = 'http://example.com/login'
    mail(to: @order.email,
         subject: "Order ID: #{@order.id}")
  end

end
