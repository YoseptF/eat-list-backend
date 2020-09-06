page = (params['page'] || 1).to_i
size = (params['size'] || 10).to_i

food_slices = Food.all.each_slice(size).to_a

json.page page
json.totalPages food_slices.length
json.foods food_slices[page - 1] do |item|
  json.merge! item.as_json
  json.images item.images
end
