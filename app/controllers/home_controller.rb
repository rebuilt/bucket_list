class HomeController < ApplicationController
  def index
    @ideas = Idea.most_recent
    if session[:user_id].present?
      @user = User.find(session[:user_id])
    else
      @user = nil
    end
  end
end
