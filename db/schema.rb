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

ActiveRecord::Schema.define(version: 20171111001755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.text "contact"
    t.text "email"
    t.string "name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admins_on_username", unique: true
  end

  create_table "admins_countries", id: false, force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.bigint "country_id", null: false
    t.index ["admin_id", "country_id"], name: "index_admins_countries_on_admin_id_and_country_id"
  end

  create_table "bipa_courses", force: :cascade do |t|
    t.string "location"
    t.integer "long"
    t.integer "unit"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bipa_courses_on_user_id"
  end

  create_table "confirmations", force: :cascade do |t|
    t.string "flight_arrival_number"
    t.date "flight_arrival_date"
    t.string "flight_arrival_hours"
    t.string "flight_return_number"
    t.date "date_of_return_flight"
    t.string "return_flight_hours"
    t.boolean "hijab"
    t.integer "dress_size"
    t.string "script_file_name"
    t.string "script_content_type"
    t.integer "script_file_size"
    t.datetime "script_updated_at"
    t.string "arrival_ticket_file_name"
    t.string "arrival_ticket_content_type"
    t.integer "arrival_ticket_file_size"
    t.datetime "arrival_ticket_updated_at"
    t.string "return_ticket_file_name"
    t.string "return_ticket_content_type"
    t.integer "return_ticket_file_size"
    t.datetime "return_ticket_updated_at"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_confirmations_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "country_code"
    t.string "iso_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landings", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "year"
    t.date "start_registration"
    t.date "end_registration"
    t.date "start_central_selection"
    t.date "start_consulate_selection"
    t.date "end_consulate_selection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.decimal "plot"
    t.decimal "content"
    t.decimal "bahasa"
    t.decimal "fluency"
    t.decimal "interlude"
    t.decimal "gesture"
    t.decimal "sound"
    t.decimal "duration"
    t.decimal "showing"
    t.integer "type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "to_indonesia", force: :cascade do |t|
    t.string "destination"
    t.integer "long"
    t.integer "unit"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_to_indonesia_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.integer "country_id"
    t.integer "admin_id"
    t.integer "gender"
    t.string "id_reg"
    t.string "passport"
    t.date "passport_expire"
    t.date "dob"
    t.string "campus"
    t.string "majors"
    t.string "phone"
    t.string "profession"
    t.boolean "win"
    t.boolean "lock"
    t.integer "contest"
    t.text "note"
    t.integer "skype_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "passport_image_file_name"
    t.string "passport_image_content_type"
    t.integer "passport_image_file_size"
    t.datetime "passport_image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bipa_courses", "users"
  add_foreign_key "confirmations", "users"
  add_foreign_key "scores", "users"
  add_foreign_key "to_indonesia", "users"
end
