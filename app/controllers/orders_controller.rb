class OrdersController < ApplicationController
  def show_pending
  end

  def show_delivered
  end

  def update
    order = Order.find(params[:id])
    order.delivered_on = DateTime.now + 5.hours + 30.minutes
    order.delivered_by = "#{@current_user.first_name} #{@current_user.last_name} (#{@current_user.email})"
    order.save
    redirect_to pending_orders_path
  end
end
