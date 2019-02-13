class GoalsController < ApplicationController
  before_action :ensure_authenticated

  def create
    idea = Idea.find(params[:idea_id])
    current_user.goals << idea unless current_user.goals.include?(idea)
    redirect_to account_goals_path
  end
end
