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
      customer = User.find_by(email: params[:walk_in_customer])

      if customer == nil
        flash[:error] = "No user with the email '#{params[:walk_in_customer]}' exists"
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
      shop_item = ShopItem.find(item.shop_item_id)
      if shop_item.number_ordered == nil
        shop_item.number_ordered = item.quantity
        shop_item.save
      else
        shop_item.number_ordered += item.quantity
        shop_item.save
      end
    end

    flash[:notice] = "Order successfully placed! Expect an owl with your items soon!"

    if current_user.role == "clerk"
      order.walk_in_customer = "#{customer.first_name} #{customer.last_name} (#{customer.email})"
      order.save
      flash[:notice] = "Order successfully placed for walk-in customer"
    end

    cart.destroy
    redirect_to "/"
  end
end
