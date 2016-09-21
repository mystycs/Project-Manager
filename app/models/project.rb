class Project < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_many :project_categories
  has_many :categories, through: :project_categories

  validates_uniqueness_of :title
  # validates_uniqueness_of :description

  validates_presence_of :category_ids, :title, :description

  # accepts_nested_attributes_for :categories

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      categories << category
    end
  end

end
