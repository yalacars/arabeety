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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "uuid-ossp"

  create_table "admins", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "name"
    t.text "email"
    t.text "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "level"
  end

  create_table "brands", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "picture_file_name"
    t.text "picture_content_type"
    t.bigint "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "car_models", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "brand"
    t.text "price"
    t.text "years"
    t.bigint "tier"
    t.bigint "years_end"
    t.bigint "order_c"
  end

  create_table "cars", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "model"
    t.text "year"
    t.text "mileage"
    t.text "condition"
    t.text "damages"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "brand"
  end

  create_table "conversations", id: false, force: :cascade do |t|
    t.bigint "id"
    t.bigint "user_id"
    t.bigint "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_visitors", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "user_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", id: false, force: :cascade do |t|
    t.bigint "id"
    t.bigint "user_id"
    t.bigint "admin_id"
    t.text "text"
    t.bigint "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "subject"
    t.text "read"
    t.text "seen_admin"
  end

  create_table "millages", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "range"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partners", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "logo_file_name"
    t.text "logo_content_type"
    t.text "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "sqlite_sequence", id: false, force: :cascade do |t|
    t.binary "name"
    t.binary "seq"
  end

  create_table "tiers", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "tier_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "total_kilometer_percentage", precision: 10
    t.decimal "one_kilometer", precision: 10
    t.decimal "two_kilometer", precision: 10
    t.decimal "three_kilometer", precision: 10
    t.decimal "four_kilometer", precision: 10
    t.decimal "five_kilometer", precision: 10
    t.decimal "six_kilometer", precision: 10
    t.decimal "seven_kilometer", precision: 10
    t.decimal "eight_kilometer", precision: 10
    t.decimal "nine_kilometer", precision: 10
    t.decimal "ten_kilometer", precision: 10
    t.decimal "eleven_kilometer", precision: 10
    t.decimal "twelve_kilometer", precision: 10
    t.decimal "thirteen_kilometer", precision: 10
    t.decimal "fourteen_kilometer", precision: 10
    t.decimal "fifthteen_kilometer", precision: 10
    t.decimal "sixthteen_kilometer", precision: 10
    t.decimal "total_year_percentage", precision: 10
    t.decimal "one_year", precision: 10
    t.decimal "two_year", precision: 10
    t.decimal "three_year", precision: 10
    t.decimal "four_year", precision: 10
    t.decimal "five_year", precision: 10
    t.decimal "six_year", precision: 10
    t.decimal "seven_year", precision: 10
    t.decimal "eight_year", precision: 10
    t.decimal "nine_year", precision: 10
    t.decimal "ten_year", precision: 10
    t.decimal "total_condition_percentage", precision: 10
    t.decimal "ac_percentage", precision: 10
    t.decimal "brakes_percentage", precision: 10
    t.decimal "electrical_percentage", precision: 10
    t.decimal "rims_percentage", precision: 10
    t.decimal "seats_percentage", precision: 10
    t.decimal "radio_percentage", precision: 10
    t.decimal "steering_percentage", precision: 10
    t.decimal "suspension_percentage", precision: 10
    t.decimal "transmission_percentage", precision: 10
    t.decimal "tyres_percentage", precision: 10
    t.decimal "chasis_percentage", precision: 10
    t.decimal "ac_bad_percentage", precision: 10
    t.decimal "ac_good_percentage", precision: 10
    t.decimal "ac_verygood_percentage", precision: 10
    t.decimal "brakes_bad_percentage", precision: 10
    t.decimal "brakes_good_percentage", precision: 10
    t.decimal "brakes_verygood_percentage", precision: 10
    t.decimal "electrical_bad_percentage", precision: 10
    t.decimal "electrical_good_percentage", precision: 10
    t.decimal "electrical_verygood_percentage", precision: 10
    t.decimal "rims_bad_percentage", precision: 10
    t.decimal "rims_good_percentage", precision: 10
    t.decimal "rims_verygood_percentage", precision: 10
    t.decimal "seats_bad_percentage", precision: 10
    t.decimal "seats_good_percentage", precision: 10
    t.decimal "seats_verygood_percentage", precision: 10
    t.decimal "radio_bad_percentage", precision: 10
    t.decimal "radio_good_percentage", precision: 10
    t.decimal "radio_verygood_percentage", precision: 10
    t.decimal "steering_bad_percentage", precision: 10
    t.decimal "steering_good_percentage", precision: 10
    t.decimal "steering_verygood_percentage", precision: 10
    t.decimal "transmission_bad_percentage", precision: 10
    t.decimal "transmission_good_percentage", precision: 10
    t.decimal "transmission_verygood_percentage", precision: 10
    t.decimal "tyres_bad_percentage", precision: 10
    t.decimal "tyres_good_percentage", precision: 10
    t.decimal "tyres_verygood_percentage", precision: 10
    t.decimal "chasis_bad_percentage", precision: 10
    t.decimal "chasis_good_percentage", precision: 10
    t.decimal "chasis_verygood_percentage", precision: 10
    t.decimal "suspension_bad_percentage", precision: 10
    t.decimal "suspension_good_percentage", precision: 10
    t.decimal "suspension_verygood_percentage", precision: 10
    t.decimal "engine_damaged", precision: 10
    t.decimal "engine_repaired", precision: 10
    t.decimal "roof_painted", precision: 10
    t.decimal "front_middle_bumper_painted", precision: 10
    t.decimal "left_front_bumper_painted", precision: 10
    t.decimal "right_front_bumper_painted", precision: 10
    t.decimal "right_front_door_painted", precision: 10
    t.decimal "right_back_door_painted", precision: 10
    t.decimal "left_front_door_painted", precision: 10
    t.decimal "left_back_door_painted", precision: 10
    t.decimal "middle_back_bumper_painted", precision: 10
    t.decimal "left_back_bumper_painted", precision: 10
    t.decimal "right_back_bumper_painted", precision: 10
    t.decimal "roof_damaged", precision: 10
    t.decimal "roof_damaged_repaired", precision: 10
    t.decimal "roof_damaged_changed", precision: 10
    t.decimal "front_middle_bumper_damaged", precision: 10
    t.decimal "front_middle_bumper_repaired", precision: 10
    t.decimal "front_middle_bumper_changed", precision: 10
    t.decimal "left_front_bumper_damaged", precision: 10
    t.decimal "left_front_bumper_repaired", precision: 10
    t.decimal "left_front_bumper_changed", precision: 10
    t.decimal "right_front_bumper_damaged", precision: 10
    t.decimal "right_front_bumper_repaired", precision: 10
    t.decimal "right_front_bumper_changed", precision: 10
    t.decimal "right_front_door_damaged", precision: 10
    t.decimal "right_front_door_repaired", precision: 10
    t.decimal "right_front_door_changed", precision: 10
    t.decimal "right_back_door_damaged", precision: 10
    t.decimal "right_back_door_repaired", precision: 10
    t.decimal "right_back_door_changed", precision: 10
    t.decimal "left_front_door_damaged", precision: 10
    t.decimal "left_front_door_repaired", precision: 10
    t.decimal "left_front_door_changed", precision: 10
    t.decimal "left_back_door_damaged", precision: 10
    t.decimal "left_back_door_repaired", precision: 10
    t.decimal "left_back_door_changed", precision: 10
    t.decimal "middle_back_bumper_damaged", precision: 10
    t.decimal "middle_back_bumper_repaired", precision: 10
    t.decimal "middle_back_bumper_changed", precision: 10
    t.decimal "left_back_bumper_damaged", precision: 10
    t.decimal "left_back_bumper_repaired", precision: 10
    t.decimal "left_back_bumper_changed", precision: 10
    t.decimal "right_back_bumper_damaged", precision: 10
    t.decimal "right_back_bumper_repaired", precision: 10
    t.decimal "right_back_bumper_changed", precision: 10
    t.text "engine_changed"
  end

  create_table "trims", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "trim"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_stats", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "state"
    t.text "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "name"
    t.text "email"
    t.text "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "phone"
    t.text "email_confirmed"
    t.text "confirm_token"
    t.text "reset_digest"
    t.datetime "reset_sent_at"
    t.text "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.text "auth_token"
    t.text "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.text "active_flag"
  end

  create_table "valuations", id: false, force: :cascade do |t|
    t.bigint "id"
    t.bigint "user_id"
    t.text "engine_condition"
    t.text "notes_engine"
    t.text "car_paint"
    t.text "engine_problem"
    t.text "accident"
    t.text "ac"
    t.text "radio"
    t.text "brand"
    t.text "trim_select"
    t.text "year_car"
    t.text "model_car"
    t.text "kilometers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "valuation_type"
    t.text "number_owners"
    t.text "brakes"
    t.text "electrical"
    t.text "rims"
    t.binary "seats"
    t.text "steering"
    t.text "suspension"
    t.text "transmission"
    t.text "tyres"
    t.text "paint_lights_left_front"
    t.text "paint_lights_hood"
    t.text "paint_lights_right_front"
    t.text "paint_first_side"
    t.text "paint_second_side"
    t.text "paint_third_side"
    t.text "paint_fourth_side"
    t.text "paint_first_top"
    t.text "paint_second_top"
    t.text "paint_third_top"
    t.text "paint_left_back"
    t.text "paint_middle_back"
    t.text "paint_right_back"
    t.text "accident_lights_left_front"
    t.text "accident_lights_hood"
    t.text "accident_lights_right_front"
    t.text "accident_first_side"
    t.text "accident_second_side"
    t.text "accident_third_side"
    t.text "accident_fourth_side"
    t.text "accident_first_top"
    t.text "accident_second_top"
    t.text "accident_third_top"
    t.text "accident_left_back"
    t.text "accident_middle_back"
    t.text "accident_right_back"
    t.text "chasis"
    t.bigint "year_car_end"
    t.text "paint_second_left_side"
    t.text "paint_third_left_side"
    t.text "accident_second_left_side"
    t.text "accident_third_left_side"
    t.decimal "final_price", precision: 10
    t.text "final_condition"
  end

  create_table "years", id: false, force: :cascade do |t|
    t.bigint "id"
    t.text "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
