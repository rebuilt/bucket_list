class PhotosController < IdeasController
  include RolesHelper
  before_action :ensure_authenticated
  before_action :load_idea
  before_action :authorize_to_edit_idea

  def index
    @photo = Unsplash::Photo.search(@idea.title).first
  end

  def create; end
end
