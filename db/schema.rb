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

ActiveRecord::Schema.define(version: 20140415023419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "component_list", force: true do |t|
    t.integer "nolist_id"
    t.integer "apid"
    t.string  "name"
  end

  create_table "directions", force: true do |t|
    t.integer  "recipe_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nolist", force: true do |t|
    t.string   "name"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_ingredients", force: true do |t|
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.integer  "quantity"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "blurb"
    t.string   "image"
    t.integer  "prep_time"
    t.integer  "inactive_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "makes"
    t.boolean  "verified"
    t.string   "name"
    t.string   "uid"
  end

end
