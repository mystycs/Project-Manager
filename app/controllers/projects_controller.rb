class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @project = Project.new
    #@category = Category.find(params[:category_id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
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
