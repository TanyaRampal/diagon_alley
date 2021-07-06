class ShopItemsController < ApplicationController
  def create
    shop_category = ShopCategory.find(params[:shop_category_id])
    shop = shop_category.shop
    item = shop_category.shop_items.find_by(name: params[:name])
    # check if category already exists in db
    if params[:shop_item_image] == ""
      flash[:error] = "Please attach item image"
    elsif item
      flash[:error] = "Shop item already exists in category #{shop_category.name} in shop #{shop.name}"
    else
      new_item = ShopItem.new(
        params.permit(:shop_category_id, :name, :description, :price, :shop_item_image)
      )
      # give a success message else give flash error
      if new_item.save
        flash[:notice] = "'#{new_item.name}' shop item successfully created within category '#{shop_category.name}' in shop '#{shop.name}'"
      else
        flash[:error] = new_item.errors.full_messages.join(", ")
      end
    end
    redirect_to "/"
  end

  def destroy
    item = ShopItem.find(params[:id])
    shop_category = item.shop_category
    shop = shop_category.shop
    flash[:notice] = "Shop item '#{item.name}' from category '#{shop_category.name}' in shop '#{shop.name}' has been successfully deleted"
    item.destroy
    redirect_to "/"
  end
end
