class GoalsController < ApplicationController
  before_action :ensure_authenticated

  def create
    @idea = Idea.find(params[:idea_id])
    current_user.goals << @idea
    respond_to do |format|
      format.html { redirect_to account_goals_path }
      format.js
    end
  end
end
