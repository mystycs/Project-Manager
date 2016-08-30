class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:user_id]
    @comment.project_id = params[:project_id]
    if @comment.save
      redirect_to project_path(@comment.project_id)
    else
      redirect_to project_path(@comment.project_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :comment, :project_id)
  end
end
