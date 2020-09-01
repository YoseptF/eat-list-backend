class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer :owner_id
      t.string :owner_type
      t.string :url, default: 'https:///via.placeholder.com/100'
      t.string :alt

      t.timestamps
    end
    add_index :images, :owner_type
  end
end
