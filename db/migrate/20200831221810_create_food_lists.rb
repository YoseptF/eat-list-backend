class CreateFoodLists < ActiveRecord::Migration[6.0]
  def change
    create_table :food_lists do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
