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

ActiveRecord::Schema.define(version: 20160616232047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dog_meetups", force: :cascade do |t|
    t.integer  "meetup_id"
    t.integer  "dog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dog_meetups", ["dog_id"], name: "index_dog_meetups_on_dog_id", using: :btree
  add_index "dog_meetups", ["meetup_id"], name: "index_dog_meetups_on_meetup_id", using: :btree

  create_table "dogs", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "size"
    t.string   "image"
    t.string   "bio"
    t.string   "breed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "dogs", ["user_id"], name: "index_dogs_on_user_id", using: :btree

  create_table "meetups", force: :cascade do |t|
    t.string   "description"
    t.string   "location"
    t.string   "address"
    t.string   "name"
    t.time     "time"
    t.date     "meetup_date"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "meetups", ["user_id"], name: "index_meetups_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "dog_meetups", "dogs"
  add_foreign_key "dog_meetups", "meetups"
  add_foreign_key "dogs", "users"
  add_foreign_key "meetups", "users"
end
