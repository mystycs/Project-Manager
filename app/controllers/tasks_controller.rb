class TasksController < ApplicationController
  def create
    @task = Task.new(comment_params)
    @task.project_id = params[:project_id]
    @task.completed = false
    if @task.save
      redirect_to project_path(@task.project_id)
    else
      redirect_to project_path(@task.project_id)
    end
  end

  def completed
    # @task = Project.find(params[:id])
    # @projectid = Task.find(params[:id])
    # @task.update_attributes(completed: 1)
    @task = Task.find(params[:id])
    @task.update_attributes(completed: true)
    redirect_to project_path(params[:project_id])
  end

  private

  def comment_params
    params.require(:task).permit(:task, :project_id)
  end
end
