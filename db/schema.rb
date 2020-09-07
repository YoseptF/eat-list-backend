# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_31_223313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_list_items", force: :cascade do |t|
    t.integer "food_list_id"
    t.integer "food_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_lists", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "current_water", default: "0.0"
    t.decimal "current_sitting", default: "0.0"
    t.decimal "current_sleep", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type"
    t.string "url", default: "https:///via.placeholder.com/100"
    t.string "alt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type"], name: "index_images_on_owner_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username", default: "anonymous"
    t.integer "age", default: 27
    t.integer "height", default: 175
    t.decimal "weight", default: "98.0"
    t.decimal "lifestyle", default: "1.2"
    t.decimal "daily_water", default: "2.0"
    t.decimal "daily_sitting", default: "7.0"
    t.decimal "daily_sleep", default: "7.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
