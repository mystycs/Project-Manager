class TasksController < ApplicationController
  def create
    @task = Task.new(comment_params)
    @task.project_id = params[:project_id]
    if @task.save
      redirect_to project_path(@task.project_id)
    else
      redirect_to project_path(@task.project_id)
    end
  end

  private

  def comment_params
    params.require(:task).permit(:task, :project_id)
  end
end
