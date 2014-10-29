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

ActiveRecord::Schema.define(version: 20141028235536) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "abc@gmail.com", null: false
    t.string   "encrypted_password",     default: "",              null: false
    t.string   "admin_name",             default: "",              null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,               null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "auction_items", force: true do |t|
    t.string   "item_name"
    t.date     "auction_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charge_logs", force: true do |t|
    t.integer  "user_id",      limit: 8
    t.integer  "charged_gold"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pricing_plays", force: true do |t|
    t.integer  "user_id",         limit: 8
    t.integer  "auction_item_id"
    t.integer  "set_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "user_id",      limit: 8
    t.string   "access_token"
    t.datetime "expired_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "snowflake_nodes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", primary_key: "user_id", force: true do |t|
    t.string   "user_name"
    t.integer  "remaining_gold", default: 0
    t.integer  "play_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
