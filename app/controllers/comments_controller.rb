class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:user_id]
    @comment.project_id = params[:project_id]
    if @comment.save
      flash[:notice] = 'You have successfully posted a comment'
      redirect_to project_path(@comment.project_id)
    else
      flash[:alert] = 'There was an error in creating the task'
      redirect_to project_path(@comment.project_id)
    end
  end

  def delete
    @task = Task.find(params[:id])
    redirect_to project_path(params[:project_id])
  end

  def show
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:error] = 'You have successfully removed a comment'
    redirect_to project_path(params[:project_id])
  # respond_to do |format|
  #   format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
  #   format.json { head :no_content }
  # end
end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :comment, :project_id)
  end
end
