class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username, default: 'anonymous'
      t.integer :age, default: 27
      t.integer :height, default: 175
      t.decimal :weight, default: 98.0
      t.decimal :lifestyle, default: 1.2

      t.timestamps
    end
  end
end
