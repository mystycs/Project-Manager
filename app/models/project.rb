class Project < ActiveRecord::Base
  #has_many :category_projects
  #has_many :projects, through: :category_projects

  # has_many :users
  # has_many :comments
  #validates :category_id, presence: true
  belongs_to :category
  belongs_to :user

  validates_uniqueness_of :title#, :scope => :description
  validates_uniqueness_of :description#, :scope => :title

  validates_presence_of :category_id, :title, :description


end
