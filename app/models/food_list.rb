class FoodList < ApplicationRecord
  belongs_to :user
  has_many :food_list_items
  has_many :foods, through: :food_list_items

  def calories
    foods.reduce(0) { |total, food| total + food.calories }
  end
end
