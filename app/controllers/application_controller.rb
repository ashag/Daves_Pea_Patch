class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
     session[:user_id] = nil
     redirect_to root_path
  end
  helper_method :current_user

  def admin?
    @current_user.admin == true
  end
  helper_method :admin 
end
