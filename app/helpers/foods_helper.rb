module FoodsHelper
  def safe_food(food_list, size)
    food_list.each_slice(size).map { |slice| slice.map(&:safe) }
  end
end
