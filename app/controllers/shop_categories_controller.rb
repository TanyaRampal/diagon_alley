class ShopCategoriesController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    shop_category = shop.shop_categories.find_by(name: params[:name])

    # check if category already exists in db
    if shop_category
      flash[:error] = "Shop category already exists in shop '#{shop.name}'"
    else
      new_category = ShopCategory.new(
        params.permit(:shop_id, :name)
      )
      # give a success message else give flash error
      if new_category.save
        flash[:notice] = "'#{new_category.name}' category successfully created within shop '#{shop.name}'"
      else
        flash[:error] = new_category.errors.full_messages.join(", ")
      end
    end
    redirect_to "/"
  end

  def update
    shop = Shop.find(params[:shop_id])
    shop_category = shop.shop_categories.find_by(name: params[:name])
    update_shop_category = ShopCategory.find(params[:id])
    # check if category already exists in db
    if shop_category
      flash[:error] = "Shop category '#{shop_category.name}' already exists in shop '#{shop.name}'"
      redirect_to "/shop_categories/#{params[:id]}/edit"
      return
    elsif params[:name] == ""
      flash[:error] = "Category name can't be blank"
      redirect_to "/shop_categories/#{params[:id]}/edit"
      return
    else
      flash[:notice] = "Successfully changed category name from '#{update_shop_category.name}' to '#{params[:name]}' in shop '#{shop.name}'"
      update_shop_category.name = params[:name]
      update_shop_category.save
    end
    redirect_to "/"
  end

  def destroy
    shop_category = ShopCategory.find(params[:id])
    shop = shop_category.shop
    shop_category.shop_items.destroy_all
    flash[:notice] = "Shop category '#{shop_category.name}' and associated shop items have been successfully deleted from shop '#{shop.name}'"
    shop_category.delete
    redirect_to "/"
  end
end
