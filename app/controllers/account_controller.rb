class AccountController < ApplicationController
  before_action :ensure_authenticated

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to account_path
    else
      render 'edit'
    end
  end

  def ideas
    @ideas = current_user.ideas
  end

  def goals
    @goals = current_user.goals
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password)
  end
end
