# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
  Food.create(
    name: Faker::Food.dish,
    calories: rand(200..1000)
  )
end

5.times do |i|
  user = User.create(
    email: Faker::Internet.email,
    password: '123',
    password_confirmation: '123'
  )
  rand(1..5).times do |i|
    user.food_lists.create(created_at: Time.zone.now - i.day)
  end

  user.food_lists.each do |list|
    list.update(current_water: rand(1..2), current_sleep: rand(1..6), current_sitting: rand(1..4))
    rand(1..5).times do
      list.food_list_items.create(food_id: rand(1..45))
    end
  end
end
