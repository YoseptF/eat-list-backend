json.logged_in current_user.present?

if current_user.present?
  json.user do
    json.merge! current_user.as_json
    json.calories current_user.calories
    json.avatar current_user.avatar
    json.currentList do
      json.merge! current_user.current_food_list.as_json
      json.calories current_user.current_food_list.calories
      json.foods current_user.current_food_list.foods do |food|
        json.merge! food.as_json
        json.images food.images
      end
    end
  end
end
