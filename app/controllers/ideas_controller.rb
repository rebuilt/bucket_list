class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    logger.info("The search term is: #{@search_term}")
    @ideas = Idea.search(@search_term)
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
  end

  def create
    idea = Idea.new(idea_params)
    idea.save!
    redirect_to ideas_path
  end

  def edit
    id = params[:id]
    @idea = Idea.find(id)
  end
 
  def update
    idea = Idea.find(params[:id])
    idea.update(idea_params)
    idea.save!
    redirect_to account_ideas_path
  end

  private

  def idea_params
    params.permit(:title, :description, :photo_url, :done_count, :name_of_user)
  end
end
