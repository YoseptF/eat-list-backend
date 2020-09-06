class FoodsController < ApplicationController
  def create
    food = Food.new(food_params)

    if food.save
      render json: {
        created: true,
        food: food
      }, status: :ok
    else
      render json: {
        created: false,
        reasons: food.errors.full_messages
      }, status: :bad_request
    end
  end

  def index
    render :index, status: :ok
  end

  def show; end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
