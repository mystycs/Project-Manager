class Project < ActiveRecord::Base
  belongs_to :category

  has_many :users
  has_many :comments
end
