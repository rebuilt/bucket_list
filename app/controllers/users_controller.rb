class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to ideas_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
