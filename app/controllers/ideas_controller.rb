class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    logger.info("The search term is: #{@search_term}")
    @ideas = Idea.all
  end
  def new
    
  end
  def create
    redirect_to ideas_index_path
  end
end
