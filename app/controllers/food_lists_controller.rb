class FoodListsController < ApplicationController
  def index
    if current_user
      render :index, status: :ok
    else
      render json: {
        message: 'you are not logged in'
      }
    end
  end

  def update_daily
    success = current_user&.current_food_list&.update(
      "current_#{params['type']}":
      "#{params['int']}.#{params['dec']}".to_f
    )
    if success
      render :update_daily, status: :ok
    else
      render json: {
        updated: false,
        message: 'are you logged in?'
      }, status: :unauthorized
    end
  end
end
