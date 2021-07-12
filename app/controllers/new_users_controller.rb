class NewUsersController < ApplicationController
  def index
    render "index", role: params[:role]
  end

  def create
    if current_user.role == "owner"
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
    else
      flash[:error] = "Action failed"
      redirect_to "/"
    end
  end

  def update
    if current_user.role == "owner"
      user = User.find_by(email: params[:email])
      update_user = User.find(params[:id])

      # check if user already exists in db
      if user
        flash[:error] = "Account already exists with given email."
        redirect_to "/new_users/#{params[:id]}/edit"
        return
      elsif params[:first_name] == "" && params[:last_name] == "" && params[:email] == "" && params[:password] == ""
        flash[:error] = "All fields are empty"
        redirect_to "/new_users/#{params[:id]}/edit"
        return
      end
      notice = []
      if params[:first_name] != ""
        notice.push("First name changed from '#{update_user.first_name}' to '#{params[:first_name]}'")
        update_user.first_name = params[:first_name]
        update_user.save
      end
      if params[:last_name] != ""
        notice.push("Last name changed from '#{update_user.last_name}' to '#{params[:last_name]}'")
        update_user.last_name = params[:last_name]
        update_user.save
      end
      if params[:email] != ""
        notice.push("Email changed from '#{update_user.email}' to '#{params[:email]}'")
        update_user.email = params[:email]
        update_user.save
      end
      if params[:password] != ""
        notice.push("Password of '#{update_user.first_name} #{update_user.last_name}' changed")
        update_user.password = params[:password]
        update_user.save
      end
      flash[:notice] = notice.join(", ")
      redirect_to all_users_path
    else
      flash[:error] = "Action failed"
      redirect_to "/"
    end
  end
end
