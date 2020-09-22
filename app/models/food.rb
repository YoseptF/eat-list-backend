class Food < ApplicationRecord
  after_create :default_values

  has_many :food_list_items
  has_many :food_lists, through: :food_list_items
  has_many :images, as: :owner

  validates :name, presence: true
  validates :calories, presence: true

  def safe
    {
      id: id,
      name: name,
      calories: calories,
      images: images
    }
  end

  def default_values
    images.create(alt: 'food image')
  end
end
