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
    # idea.title = params[:title]
    # idea.done_count = params[:done_count]
    # idea.photo_url = params[:photo_url]
    idea.save!
    redirect_to ideas_index_path
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

  def idea_params
    params.permit(:title, :description, :photo_url, :done_count)
  end
end
