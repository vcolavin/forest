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

ActiveRecord::Schema.define(version: 20160714163330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "location_objects", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "object_id"
    t.string   "object_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "location_objects", ["object_id", "object_type"], name: "index_location_objects_on_object_id_and_object_type", using: :btree

  create_table "locations", force: :cascade do |t|
    t.integer "x_coordinate"
    t.integer "y_coordinate"
  end

  add_index "locations", ["x_coordinate", "y_coordinate"], name: "index_locations_on_x_coordinate_and_y_coordinate", unique: true, using: :btree

  create_table "rabbits", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trees", force: :cascade do |t|
    t.integer  "number_of_branches"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wolves", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
