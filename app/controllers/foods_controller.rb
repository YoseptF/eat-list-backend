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

  def update
    success = Food.find(params['id'])&.update(food_params)

    if success
      render json: {
        updated: true,
        image: success
      }, status: :ok
    else
      render json: {
        updated: false,
        message: 'id the id correct?'
      }, status: :no_content
    end
  end

  def show; end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
