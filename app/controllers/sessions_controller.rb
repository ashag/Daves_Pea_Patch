class SessionsController < ApplicationController

  def create
    if auth_hash["uid"]
      @user = User.find_or_create_from_auth_hash(auth_hash)
      if @user 
        session[:user_id] = @user.id
        redirect_to root_path, notice: "#{@user.username} is now signed in"
      else
        redirect_to root_path, notice: "Failed to save user"
      end
    else
      redirect_to root_path, notice: "Failed to authenticate"
    end
  end


  def destroy
    reset_session
    redirect_to root_path, notice: "You have been successfully signed out"
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end