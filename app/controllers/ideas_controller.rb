class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    logger.info("The search term is: #{@search_term}")
  end
  def new
    
  end
  def create
    redirect_to ideas_index_path
  end
end
