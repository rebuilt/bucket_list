class GoalsController < ApplicationController
  before_action :ensure_authenticated, only: %i[create destroy]

  def create
    @idea = Idea.find(params[:idea_id])
    current_user.goals << @idea

    respond_to do |format|
      format.html { redirect_to idea_path(@idea) }
      format.js { render 'create' }
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
    @user.goals.delete(@idea)
  end
end
