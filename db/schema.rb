# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150928201654) do

  create_table "flight_people", force: true do |t|
    t.integer  "flight_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_pilot",   default: false
  end

  create_table "flight_types", force: true do |t|
    t.string   "name_flight"
    t.string   "description"
    t.integer  "price"
    t.integer  "status",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", force: true do |t|
    t.integer  "plane_id"
    t.integer  "person_id"
    t.date     "date"
    t.integer  "flight_type_id"
    t.integer  "time_fly"
    t.string   "km_start"
    t.string   "km_end"
    t.integer  "fuel_charged"
    t.integer  "status",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functions", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "mail"
    t.string   "home"
    t.integer  "phone"
    t.integer  "age"
    t.boolean  "pilot"
    t.boolean  "guest"
    t.string   "id_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     default: 0
  end

  create_table "pilot_habilitations", force: true do |t|
    t.integer  "person_id"
    t.date     "date_expiration"
    t.date     "date_start"
    t.integer  "status",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "planes", force: true do |t|
    t.string   "name"
    t.string   "model"
    t.integer  "year"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "matricula"
    t.integer  "status",      default: 0
  end

  create_table "rol_functions", force: true do |t|
    t.integer  "rol_id"
    t.integer  "function_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rols", force: true do |t|
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.date     "date"
    t.integer  "plane_id"
    t.integer  "status",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_flights", force: true do |t|
    t.integer  "flight_id"
    t.integer  "person_id"
    t.integer  "plane_id"
    t.integer  "flight_type_id"
    t.integer  "price"
    t.integer  "status",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "km_start"
    t.integer  "km_end"
    t.integer  "time_fly"
  end

  create_table "ticket_members", force: true do |t|
    t.integer  "person_id"
    t.integer  "price"
    t.integer  "status",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "user_rols", force: true do |t|
    t.integer  "user_id"
    t.integer  "rol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "active",                 default: true
    t.integer  "role",                   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
