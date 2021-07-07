class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def create
    user = User.find_by(email: params[:email])

    if user
      # give a welcome message (in /todos) if account is signed-in else give flash error
      if user.authenticate(params[:password])
        greeting = "Good " + if Time.now.hour + 5.hours + 30.minutes < 12
          "Morning"
        elsif Time.now.hour + 5.hours + 30.minutes > 12 && Time.now.hour + 5.hours + 30.minutes < 17
          "Afternoon"
        else
          "Evening"
        end
        flash[:welcome] = "#{greeting}, #{user.first_name.capitalize} #{user.last_name.capitalize} :)"
        session[:current_user_id] = user.id
        redirect_to "/"
      else
        flash[:error] = "Password of '#{user.email}' is incorrect. Please retry."
        redirect_to "/"
      end
    else
      if params[:email] == ""
        flash[:error] = "Please enter your email-id"
      else
        flash[:error] = "No account with user-email '#{params[:email]}' exists. Please retry."
      end
      redirect_to "/"
    end
  end

  def destroy
    @current_user = User.find(session[:current_user_id])
    if @current_user.role == "owner"
      errors = []
      Shop.all.each do |shop|
        if shop.shop_categories.count == 0
          errors.push("The shop '#{shop.name}' has no categories")
        end
        shop.shop_categories.each do |shop_category|
          if shop_category.shop_items.count == 0
            errors.push("The category '#{shop_category.name}' within shop '#{shop.name}' has no items")
          end
        end
      end
      if errors != []
        flash[:error] = errors.join(", ")
        redirect_to "/"
        return
      end
    end

    session[:current_user_id] = nil
    # give sign-out success message in homepage(index)
    flash[:notice] = "You have successfully signed out."
    @current_user = nil
    redirect_to "/"
  end
end
