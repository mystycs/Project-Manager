class Category < ActiveRecord::Base
  #has_many :category_projects
  #has_many :projects, through: :category_projects
  has_many :projects

  validates_uniqueness_of :title
  validates_presence_of :title


end
