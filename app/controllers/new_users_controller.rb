class NewUsersController < ApplicationController
  def index
    render "index", role: params[:role]
  end

  def create
    user = User.find_by(email: params[:email])

    # check if user already exists in db
    if user
      flash[:error] = "Account already exists with given email."
      redirect_to new_users_path("role" => params[:role])
    else
      new_user = User.new(
        first_name: params[:first_name].strip.downcase.capitalize,
        last_name: params[:last_name].strip.downcase.capitalize,
        email: params[:email],
        password: params[:password],
        role: params[:role],
      )
      if new_user.save
        flash[:notice] = "You have successfully created a new #{params[:role]} account"
        redirect_to "/"
      else
        flash[:error] = new_user.errors.full_messages.join(", ")
        redirect_to new_users_path("role" => params[:role])
      end
    end
  end
end
