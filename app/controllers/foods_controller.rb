class FoodsController < ApplicationController
  def create; end

  def index
    page = (params['page'] || 1).to_i
    size = (params['size'] || 10).to_i

    food_slices = safe_food(Food.all, size)

    render json: {
      page: page,
      totalPages: food_slices.length,
      foods: food_slices[page - 1]
    }, status: :ok
  end

  def show; end
end
