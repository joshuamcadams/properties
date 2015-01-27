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

ActiveRecord::Schema.define(version: 20150127025927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "internal_properties", force: :cascade do |t|
    t.string   "name",              limit: 50
    t.decimal  "price"
    t.string   "address"
    t.text     "description"
    t.string   "short_description"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "internal_properties", ["user_id"], name: "index_internal_properties_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "file_name"
    t.integer  "internal_property_id"
    t.integer  "order"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "photos", ["internal_property_id"], name: "index_photos_on_internal_property_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name", limit: 25
    t.string   "last_name",  limit: 50
    t.string   "title",      limit: 50
    t.string   "email",                 default: "", null: false
    t.string   "password",   limit: 40
    t.text     "bio"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
