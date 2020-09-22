class FoodListItem < ApplicationRecord
  belongs_to :food
  belongs_to :food_list

  validates :food_id, presence: true
  validates :food_list_id, presence: true
end
