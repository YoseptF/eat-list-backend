class CreateFoodLists < ActiveRecord::Migration[6.0]
  def change
    create_table :food_lists do |t|
      t.integer :user_id
      t.decimal :current_water, default: 0.0
      t.decimal :current_sitting, default: 0.0
      t.decimal :current_sleep, default: 0.0

      t.timestamps
    end
  end
end
