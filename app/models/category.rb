class Category < ActiveRecord::Base
  # has_many :category_projects
  # has_many :projects, through: :category_projects
  #has_many :projects

  has_many :project_categories
  has_many :projects, through: :project_categories

  validates_uniqueness_of :title
  validates_presence_of :title
end
