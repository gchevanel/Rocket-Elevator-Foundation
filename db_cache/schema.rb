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

ActiveRecord::Schema.define(version: 2019_04_01_154538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dimcustomers", force: :cascade do |t|
    t.string "creation_date"
    t.string "company_name"
    t.string "name_of_company_contact"
    t.string "email_company"
    t.string "nb_elevators"
    t.string "customer_city"
  end

  create_table "fact_elevators", force: :cascade do |t|
    t.string "elevator_id"
    t.string "serial_number"
    t.string "commissioning_date"
    t.string "building_id"
    t.string "customer_id"
    t.string "city_of_building"
  end

  create_table "fact_interventions", force: :cascade do |t|
    t.string "employee_id"
    t.string "building_id"
    t.string "battery_id"
    t.string "column_id"
    t.string "elevator_id"
    t.datetime "timestart"
    t.datetime "timefinish"
    t.string "result"
    t.string "report"
    t.string "status"
  end

  create_table "factcontacts", force: :cascade do |t|
    t.string "contact_id"
    t.datetime "creation_date"
    t.string "company_name"
    t.string "email"
    t.string "project_name"
  end

  create_table "factquotes", force: :cascade do |t|
    t.string "quote_id"
    t.datetime "creation_date"
    t.string "name"
    t.string "email"
    t.string "nbelevators"
  end

end
