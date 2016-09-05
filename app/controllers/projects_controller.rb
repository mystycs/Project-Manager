class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @project = Project.new
    # @category = Category.find(params[:category_id])
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      flash[:notice] = 'Project successfully created'
      redirect_to project_path(@project)
    else
      flash[:alert] = 'Project could not be created'
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @user = User.find(@project.user_id).full_name
    @comment = Comment.new
    @comments = Comment.filter_comments(@project.id)
    @task = Task.new
    @tasks = Task.filter_tasks(@project.id)
    # @task_completed = Task.completed?(@task_id)
    # @category = Category.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :category_id, :task_id)
  end
end
