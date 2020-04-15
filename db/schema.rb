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

ActiveRecord::Schema.define(version: 2020_04_13_235456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aircraft_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "aircrafts", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.bigint "aircraft_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aircraft_type_id"], name: "index_aircrafts_on_aircraft_type_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "flight_id", null: false
    t.bigint "customer_id", null: false
    t.date "date_created"
    t.boolean "is_confirmed"
    t.boolean "is_cancelled"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.integer "weight"
    t.string "passport_no"
    t.date "passport_expiry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_customers_on_person_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.date "date_start"
    t.string "section"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_employees_on_person_id"
  end

  create_table "flights", force: :cascade do |t|
    t.bigint "aircraft_id", null: false
    t.bigint "route_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aircraft_id"], name: "index_flights_on_aircraft_id"
    t.index ["route_id"], name: "index_flights_on_route_id"
  end

  create_table "maintenances", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "aircraft_id", null: false
    t.date "date_scheduled"
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aircraft_id"], name: "index_maintenances_on_aircraft_id"
    t.index ["employee_id"], name: "index_maintenances_on_employee_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
    t.index ["customer_id"], name: "index_passengers_on_customer_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "last_name"
    t.string "names"
    t.date "birth_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rota", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "shift_date"
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_rota_on_employee_id"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "origin"
    t.integer "destination"
    t.decimal "fare"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "aircrafts", "aircraft_types"
  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "flights"
  add_foreign_key "customers", "people"
  add_foreign_key "employees", "people"
  add_foreign_key "flights", "aircrafts"
  add_foreign_key "flights", "routes"
  add_foreign_key "maintenances", "aircrafts"
  add_foreign_key "maintenances", "employees"
  add_foreign_key "passengers", "bookings"
  add_foreign_key "passengers", "customers"
  add_foreign_key "rota", "employees"
end
