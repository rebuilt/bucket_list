class CommentsController < ApplicationController
  before_action :ensure_authenticated,  only: %i[create]
  helper_method :current_user

  def create
    @comment = Comment.new comment_params
    idea = Idea.find(params[:idea_id])
    @comment.idea = idea
    @comment.user = current_user 
    @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
