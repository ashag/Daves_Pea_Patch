class UsersController < ApplicationController

  def show
    @tools = current_user.user_tools.where(status: "out")

    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(email: params[:user][:email])

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :uid, :provider, :avatar_url, :admin)
  end
end