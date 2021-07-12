class ShopItemsController < ApplicationController
  def create
    if current_user.role == "owner"
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
    else
      flash[:error] = "Action failed"
      redirect_to "/"
    end
  end

  def update
    if current_user.role == "owner"
      shop_category = ShopCategory.find(params[:shop_category_id])
      shop = shop_category.shop
      item = shop_category.shop_items.find_by(name: params[:name])
      update_item = ShopItem.find(params[:id])
      # check if category already exists in db
      if item
        flash[:error] = "Shop item '#{item.name}' already exists in category '#{shop_category.name}' in shop '#{shop.name}'"
        redirect_to "/shop_items/#{params[:id]}/edit"
        return
      elsif params[:name] == "" && params[:price] == "" && params[:description] == "" && params[:shop_item_image] == ""
        flash[:error] = "All fields are blank"
        redirect_to "/shop_items/#{params[:id]}/edit"
        return
      end
      flash[:notice] = ""
      if params[:name] != ""
        flash[:notice] += "Changed name from '#{update_item.name}' to #{params[:name]}, "
        update_item.name = params[:name]
        update_item.save
      end
      if params[:price] != ""
        flash[:notice] += "Changed price from '#{update_item.price}' to #{params[:price]}, "
        update_item.price = params[:price]
        update_item.save
      end
      if params[:description] != ""
        flash[:notice] += "Changed description of '#{update_item.name}', "
        update_item.description = params[:description]
        update_item.save
      end
      if params[:shop_item_image] != ""
        flash[:notice] += "Changed item image of '#{update_item.name}', "
        update_item.shop_item_image.attach(params[:shop_item_image])
        update_item.save
      end
      flash[:notice] += "within category '#{shop_category.name}' in shop '#{shop.name}'"
      redirect_to "/"
    else
      flash[:error] = "Action failed"
      redirect_to "/"
    end
  end

  def destroy
    if current_user.role == "owner"
      item = ShopItem.find(params[:id])
      shop_category = item.shop_category
      shop = shop_category.shop
      flash[:notice] = "Shop item '#{item.name}' from category '#{shop_category.name}' in shop '#{shop.name}' has been successfully deleted"
      item.destroy
      redirect_to "/"
    else
      flash[:error] = "Action failed"
      redirect_to "/"
    end
  end
end
