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

ActiveRecord::Schema.define(version: 20161203171819) do

  create_table "favorite_schools", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.integer  "rating"
    t.text     "comment"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "reviews", ["school_id"], name: "index_reviews_on_school_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "zipcode"
    t.string   "grade_level"
    t.string   "school_type"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.binary   "image"
    t.integer  "review_id"
    t.integer  "school_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "users", ["review_id"], name: "index_users_on_review_id"
  add_index "users", ["school_id"], name: "index_users_on_school_id"

end
