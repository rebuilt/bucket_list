class IdeasController < ApplicationController
  include RolesHelper
  before_action :ensure_authenticated,   only: %i[new create edit update destroy]
  before_action :load_idea,              only: %i[show edit update]
  before_action :authorize_to_edit_idea, only: %i[edit update]

  def index
    @search_term = params[:q]
    logger.info("The search term is: #{@search_term}")
    @ideas = Idea.search(@search_term).page(params[:page])
  end

  def show
    @comment = Comment.new
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_resource_params)
    @idea.user = current_user
    if @idea.save
      redirect_to ideas_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @idea.update(idea_resource_params)
      redirect_to account_ideas_path
    else
      render 'edit'
    end
  end

  def destroy
    load_idea
    @idea.destroy!
  end

  private

  def idea_resource_params
    params.require(:idea).permit(:title,
                                 :description,
                                 :photo_url,
                                 :done_count,
                                 :name_of_user)
  end

  def load_idea
    @idea = Idea.find(params[:id]) unless params[:id].nil?
    @idea = Idea.find(params[:idea_id]) unless params[:idea_id].nil?
  end

  def authorize_to_edit_idea
    redirect_to(account_path) unless can_edit?(@idea)
  end
end
