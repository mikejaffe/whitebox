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

ActiveRecord::Schema.define(version: 20130814133303) do

  create_table "line_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media", force: true do |t|
    t.integer  "line_item_id"
    t.text     "media_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "order_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "status",                                     default: "cart"
    t.string   "ad_url"
    t.string   "ad_mailto"
    t.date     "ad_start_date"
    t.integer  "ad_run_days"
    t.date     "ad_end_date"
    t.decimal  "total_cost",        precision: 12, scale: 2
    t.string   "email"
    t.string   "company_name"
    t.string   "website"
    t.string   "bill_first_name"
    t.string   "bill_last_name"
    t.string   "bill_address1"
    t.string   "bill_address2"
    t.string   "bill_city"
    t.string   "bill_state"
    t.string   "bill_zip"
    t.string   "bill_phone"
    t.string   "ship_first_name"
    t.string   "ship_last_name"
    t.string   "ship_address1"
    t.string   "ship_address2"
    t.string   "ship_city"
    t.string   "ship_state"
    t.string   "ship_zip"
    t.string   "ship_phone"
    t.string   "paypal_result"
    t.string   "order_session_key"
  end

  create_table "products", force: true do |t|
    t.string   "sku"
    t.string   "name"
    t.string   "description"
    t.decimal  "price",       precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "line_count"
    t.integer  "char_count"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
