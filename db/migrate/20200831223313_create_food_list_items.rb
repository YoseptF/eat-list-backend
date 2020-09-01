class CreateFoodListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :food_list_items do |t|
      t.integer :food_list_id
      t.integer :food_id

      t.timestamps
    end
  end
end
