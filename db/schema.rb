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

ActiveRecord::Schema.define(version: 20150503014221) do

  create_table "tags", force: :cascade do |t|
    t.string   "content"
    t.datetime "parent_created_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "parent_tweet_id"
    t.integer  "parent_user_id"
    t.string   "location"
    t.boolean  "is_agg"
  end

  create_table "tweets", force: :cascade do |t|
    t.text     "content"
    t.string   "tags"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "tweet_id",                limit: 8
    t.datetime "tweet_created_at"
    t.string   "location"
    t.string   "user_screen_name"
    t.boolean  "is_retweet"
    t.integer  "retweet_count"
    t.string   "in_reply_to_screen_name"
    t.integer  "favorite_count"
    t.boolean  "is_reply"
    t.string   "user_mentions"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "screen_name"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "utags", force: :cascade do |t|
    t.integer  "count"
    t.integer  "rt_count"
    t.integer  "fav_count"
    t.datetime "first_mention"
    t.datetime "last_mention"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "content"
    t.integer  "pop_score"
  end

end
