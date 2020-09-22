class FoodListItemsController < ApplicationController
  def create
    food_list_item = FoodListItem.new(food_list_item_params)

    if food_list_item.save
      render json: {
        created: true,
        foodListItem: food_list_item
      }, status: :ok
    else
      render json: {
        created: false,
        reasons: food_list_item.errors.full_messages
      }
    end
  end

  def destroy
    success = FoodListItem.find_by(
      food_id: food_list_item_params['food_id'],
      food_list_id: food_list_item_params['food_list_id']
    )&.destroy

    if success
      render json: {
        message: 'food deleted',
        food: success
      }
    else
      render json: {
        message: 'failed to delete food, is the id correct?'
      }
    end
  end

  def delete_from_current
    success = food_from_user(params['food_list_item']['food_id'], current_user)

    if success
      render json: {
        message: 'food deleted',
        food: success
      }
    else
      render json: {
        message: 'failed to delete food, is the id correct?'
      }
    end
  end

  def add_food_to_current
    unless current_user
      render json: { message: 'You are not logged in' }, status: :unauthorized
      return
    end

    food_list_item = food_on_current(food_list_item_params, current_user)

    if food_list_item.save
      render json: {
        created: true,
        foodListItem: food_list_item
      }, status: :ok
    else
      render json: {
        created: false,
        reasons: food_list_item.errors.full_messages
      }
    end
  end

  private

  def food_list_item_params
    params.require(:food_list_item).permit(:food_id, :food_list_id)
  end
end
