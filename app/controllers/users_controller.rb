class UsersController < ApplicationController

  def show
    @tools = current_user.user_tools.where(status: "out")
  end

  def destroy
    @user = User.find(:id)
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :uid, :provider, :avatar_url, :admin)
  end
end