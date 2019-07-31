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

ActiveRecord::Schema.define(version: 2019_07_31_135808) do

  create_table "affiliations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.string "gender"
    t.string "weapon"
    t.string "vehicle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people_affiliations", force: :cascade do |t|
    t.integer "people_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["people_id"], name: "index_people_affiliations_on_people_id"
  end

  create_table "people_locations", force: :cascade do |t|
    t.integer "people_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["people_id"], name: "index_people_locations_on_people_id"
  end

end
