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

ActiveRecord::Schema.define(version: 20170124020549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenge_categories", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "category_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "public"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "user_challenge_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "forums", force: :cascade do |t|
    t.text     "text"
    t.string   "image"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "user_challenge_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "user_challenge_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "text"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_challenges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.text     "results_reflection"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "title"
    t.text     "description"
    t.string   "status"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
