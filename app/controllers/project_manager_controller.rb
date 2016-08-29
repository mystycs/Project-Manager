class ProjectManagerController < ApplicationController
  def index
    @categories = Category.all
    @projects = Project.all
  end
end
