class CartItemsController < ApplicationController
  def create
    params[:quantity] = 1
    item = CartItem.create!(
      params.permit(:cart_id, :shop_item_id, :shop_item_name, :shop_item_price, :quantity)
    )
    redirect_to shops_path
  end

  def update
    item = current_user.carts.first.cart_items.find(params[:id])
    if params[:value] == "increase"
      item.quantity += 1
    else
      item.quantity -= 1
    end
    if item.quantity > 0
      item.save
    else
      item.destroy
    end
    redirect_to shops_path
  end
end
