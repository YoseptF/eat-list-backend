module FoodsHelper
  def food_from_user(food_id, user)
    user.current_food_list.food_list_items.find_by(food_id: food_id)&.delete
  end

  def food_on_current(params, user)
    user.current_food_list.food_list_items.new(params)
  end
end
