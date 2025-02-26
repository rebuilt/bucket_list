class CommentsController < ApplicationController
  before_action :ensure_authenticated, only: :create

  def create
    idea = Idea.find(params[:idea_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.idea = idea
    @comment.save
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
