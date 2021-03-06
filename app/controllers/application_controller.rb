class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in
  before_action :set_bg

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end

  def current_user
    return @current_user if @current_user

    current_user_id = session[:current_user_id]
    @current_user = current_user_id ? User.find(current_user_id) : nil
  end

  def set_bg
    @bg = @current_user ? "shop" : "homepage"
  end
end
