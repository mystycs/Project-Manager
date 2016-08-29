class Project < ActiveRecord::Base
  #has_many :category_projects
  #has_many :projects, through: :category_projects

  # has_many :users
  # has_many :comments
  #validates :category_id, presence: true
  belongs_to :category
end
