class ShopsController < ApplicationController
  def index
    if current_user.carts == []
      redirect_to carts_path
      return
    end
    render "show"
  end

  def create
    shop = Shop.find_by(name: params[:name])

    # check if shop already exists in db
    if shop
      flash[:error] = "Shop with name '#{params[:name]}' already exists"
    elsif params[:name] == "" && params[:shop_image] == ""
      flash[:error] = "Shop name can't be blank, No image attached"
    elsif params[:name] != "" && params[:shop_image] == ""
      flash[:error] = "Please attach image for '#{params[:name]}'"
    elsif params[:name] == "" && params[:shop_image] != ""
      flash[:error] = "No shop name given for attached image"
    else
      Shop.create!(
        name: params[:name],
        shop_image: params[:shop_image],
      )
      flash[:notice] = "New shop '#{params[:name]}' successfully created"
    end
    redirect_to "/"
  end

  def update
    shop = Shop.find_by(name: params[:name])
    update_shop = Shop.find(params[:id])

    # check if shop already exists in db
    if shop
      flash[:error] = "Shop with name '#{params[:name]}' already exists"
      redirect_to "/shops/#{params[:id]}/edit"
      return
    elsif params[:name] == "" && params[:shop_image] == ""
      flash[:error] = "Shop name can't be blank, No image attached"
      redirect_to "/shops/#{params[:id]}/edit"
      return
    elsif params[:name] != "" && params[:shop_image] == ""
      flash[:notice] = "Successfully changed shop name from '#{update_shop.name}' to '#{params[:name]}'"
      update_shop.name = params[:name]
      update_shop.save
    elsif params[:name] == "" && params[:shop_image] != ""
      flash[:notice] = "Successfully changed shop image of '#{update_shop.name}'"
      update_shop.shop_image.attach(params[:shop_image])
      update_shop.save
    else
      flash[:notice] = "Successfully changed shop image, and changed shop name from '#{update_shop.name}' to '#{params[:name]}'"
      update_shop.shop_image.attach(params[:shop_image])
      update_shop.name = params[:name]
      update_shop.save
    end
    redirect_to "/"
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.shop_categories.each do |category_item|
      shop_category = ShopCategory.find(category_item.id)
      shop_category.shop_items.destroy_all
      shop_category.delete
    end
    flash[:notice] = "Shop '#{shop.name}' and associated shop categories and items have been successfully deleted"
    shop.destroy!
    redirect_to "/"
  end
end
