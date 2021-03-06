class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def create
    user = User.find_by(email: params[:email])

    # check if user already exists in db
    if user
      flash[:error] = "Account already exists with given email."
      redirect_to new_user_path
    else
      new_user = User.new(
        first_name: params[:first_name].strip.downcase.capitalize,
        last_name: params[:last_name].strip.downcase.capitalize,
        email: params[:email],
        password: params[:password],
        role: params[:role],
      )
      # give a success message (in homepage) if account is created else give flash error
      if new_user.save
        flash[:notice] = "You have successfully created a new account."
        redirect_to "/"
      else
        flash[:error] = new_user.errors.full_messages.join(", ")
        redirect_to new_user_path
      end
    end
  end
end
