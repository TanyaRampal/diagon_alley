class CartsController < ApplicationController
  def index
    Cart.create!(
      user_id: current_user.id,
    )
    redirect_to "/"
  end

  def show
  end

  def destroy
    if current_user.role == "clerk"
      customer_name = params[:walk_in_customer].split(" ")
      customer_name = customer_name.map { |name| name.strip.downcase.capitalize }
      customer = User.find_by(first_name: customer_name[0], last_name: customer_name[1])

      if customer == nil
        flash[:error] = "No user with the name '#{customer_name[0]} #{customer_name[1]}' exists"
        redirect_to cart_path
        return
      end
    end

    cart = current_user.carts.find(params[:id])
    order = Order.create!(
      user_id: current_user.id,
      ordered_on: DateTime.now + 5.hours + 30.minutes,
    )
    cart.cart_items.each do |item|
      OrderItem.create!(
        order_id: order.id,
        shop_item_id: item.shop_item_id,
        shop_item_name: item.shop_item_name,
        shop_item_price: item.shop_item_price,
        quantity: item.quantity,
      )
    end

    if current_user.role == "clerk"
      order.walk_in_customer = "#{customer.first_name} #{customer.last_name} (#{customer.email})"
      order.save
    end

    cart.destroy
    redirect_to "/"
  end
end
