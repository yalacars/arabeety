# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190402215856) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size", limit: 8
    t.datetime "picture_updated_at"
  end

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "brand"
    t.string "price"
    t.string "years"
    t.integer "tier"
    t.integer "years_end"
    t.integer "order_c"
  end

  create_table "cars", force: :cascade do |t|
    t.string "model"
    t.string "year"
    t.string "mileage"
    t.string "condition"
    t.string "damages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_visitors", force: :cascade do |t|
    t.string "user_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_id"
    t.string "text"
    t.integer "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject"
    t.boolean "read"
    t.boolean "seen_admin"
  end

  create_table "millages", force: :cascade do |t|
    t.string "range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.bigint "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "tiers", force: :cascade do |t|
    t.string "tier_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total_kilometer_percentage"
    t.float "one_kilometer"
    t.float "two_kilometer"
    t.float "three_kilometer"
    t.float "four_kilometer"
    t.float "five_kilometer"
    t.float "six_kilometer"
    t.float "seven_kilometer"
    t.float "eight_kilometer"
    t.float "nine_kilometer"
    t.float "ten_kilometer"
    t.float "eleven_kilometer"
    t.float "twelve_kilometer"
    t.float "thirteen_kilometer"
    t.float "fourteen_kilometer"
    t.float "fifthteen_kilometer"
    t.float "sixthteen_kilometer"
    t.float "total_year_percentage"
    t.float "one_year"
    t.float "two_year"
    t.float "three_year"
    t.float "four_year"
    t.float "five_year"
    t.float "six_year"
    t.float "seven_year"
    t.float "eight_year"
    t.float "nine_year"
    t.float "ten_year"
    t.float "total_condition_percentage"
    t.float "ac_percentage"
    t.float "brakes_percentage"
    t.float "electrical_percentage"
    t.float "rims_percentage"
    t.float "seats_percentage"
    t.float "radio_percentage"
    t.float "steering_percentage"
    t.float "suspension_percentage"
    t.float "transmission_percentage"
    t.float "tyres_percentage"
    t.float "chasis_percentage"
    t.float "ac_bad_percentage"
    t.float "ac_good_percentage"
    t.float "ac_verygood_percentage"
    t.float "brakes_bad_percentage"
    t.float "brakes_good_percentage"
    t.float "brakes_verygood_percentage"
    t.float "electrical_bad_percentage"
    t.float "electrical_good_percentage"
    t.float "electrical_verygood_percentage"
    t.float "rims_bad_percentage"
    t.float "rims_good_percentage"
    t.float "rims_verygood_percentage"
    t.float "seats_bad_percentage"
    t.float "seats_good_percentage"
    t.float "seats_verygood_percentage"
    t.float "radio_bad_percentage"
    t.float "radio_good_percentage"
    t.float "radio_verygood_percentage"
    t.float "steering_bad_percentage"
    t.float "steering_good_percentage"
    t.float "steering_verygood_percentage"
    t.float "transmission_bad_percentage"
    t.float "transmission_good_percentage"
    t.float "transmission_verygood_percentage"
    t.float "tyres_bad_percentage"
    t.float "tyres_good_percentage"
    t.float "tyres_verygood_percentage"
    t.float "chasis_bad_percentage"
    t.float "chasis_good_percentage"
    t.float "chasis_verygood_percentage"
    t.float "suspension_bad_percentage"
    t.float "suspension_good_percentage"
    t.float "suspension_verygood_percentage"
    t.float "engine_damaged"
    t.float "engine_repaired"
    t.float "roof_painted"
    t.float "front_middle_bumper_painted"
    t.float "left_front_bumper_painted"
    t.float "right_front_bumper_painted"
    t.float "right_front_door_painted"
    t.float "right_back_door_painted"
    t.float "left_front_door_painted"
    t.float "left_back_door_painted"
    t.float "middle_back_bumper_painted"
    t.float "left_back_bumper_painted"
    t.float "right_back_bumper_painted"
    t.float "roof_damaged"
    t.float "roof_damaged_repaired"
    t.float "roof_damaged_changed"
    t.float "front_middle_bumper_damaged"
    t.float "front_middle_bumper_repaired"
    t.float "front_middle_bumper_changed"
    t.float "left_front_bumper_damaged"
    t.float "left_front_bumper_repaired"
    t.float "left_front_bumper_changed"
    t.float "right_front_bumper_damaged"
    t.float "right_front_bumper_repaired"
    t.float "right_front_bumper_changed"
    t.float "right_front_door_damaged"
    t.float "right_front_door_repaired"
    t.float "right_front_door_changed"
    t.float "right_back_door_damaged"
    t.float "right_back_door_repaired"
    t.float "right_back_door_changed"
    t.float "left_front_door_damaged"
    t.float "left_front_door_repaired"
    t.float "left_front_door_changed"
    t.float "left_back_door_damaged"
    t.float "left_back_door_repaired"
    t.float "left_back_door_changed"
    t.float "middle_back_bumper_damaged"
    t.float "middle_back_bumper_repaired"
    t.float "middle_back_bumper_changed"
    t.float "left_back_bumper_damaged"
    t.float "left_back_bumper_repaired"
    t.float "left_back_bumper_changed"
    t.float "right_back_bumper_damaged"
    t.float "right_back_bumper_repaired"
    t.float "right_back_bumper_changed"
    t.string "engine_changed"
  end

  create_table "trims", force: :cascade do |t|
    t.string "trim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_stats", force: :cascade do |t|
    t.string "state"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "auth_token"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean "active_flag"
  end

# Could not dump table "valuations" because of following StandardError
#   Unknown type '' for column 'seats'

  create_table "years", force: :cascade do |t|
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
