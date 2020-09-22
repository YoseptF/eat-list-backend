json.array! current_user.food_lists.order('created_at DESC') do |food|
  json.merge! food.as_json
  json.calories food.calories
end
