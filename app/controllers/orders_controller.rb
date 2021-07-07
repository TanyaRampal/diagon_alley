class OrdersController < ApplicationController
  def show_customers_orders
    render plain: params
  end

  def update
    order = Order.find(params[:id])
    order.delivered_on = DateTime.now + 5.hours + 30.minutes
    order.delivered_by = "#{@current_user.first_name} #{@current_user.last_name} (#{@current_user.email})"
    flash[:notice] = "Order successfully marked as delivered"
    order.save
    redirect_to pending_orders_path
  end
end
