class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @project = Project.new
    #@category = Category.find(params[:category_id])
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @user = User.find(@project.user_id).full_name
    #@category = Category.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :category_id)
  end

end
