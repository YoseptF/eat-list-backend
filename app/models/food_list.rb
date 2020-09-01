class FoodList < ApplicationRecord
  belongs_to :user
  has_many :food_list_items
  has_many :foods, through: :food_list_items
end
