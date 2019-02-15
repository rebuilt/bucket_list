class PhotosController < IdeasController
  include RolesHelper
  before_action :ensure_authenticated
  before_action :load_idea
  before_action :authorize_to_edit_idea

  def index
    @photos = Unsplash::Photo.search(@idea.title)
  end

  def create
    @idea.update_attributes photo_url: params[:photo_url]

    redirect_to edit_idea_path(@idea)
  end
end
