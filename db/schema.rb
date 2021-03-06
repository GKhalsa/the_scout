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

ActiveRecord::Schema.define(version: 20160613232503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amazon_items", force: :cascade do |t|
    t.string   "url"
    t.string   "lowest_new_price"
    t.string   "quantity_new"
    t.string   "sales_rank"
    t.string   "upc"
    t.string   "prime"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "image_url"
    t.string   "title"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.float    "salePrice"
    t.string   "upc"
    t.string   "stock"
    t.boolean  "availableOnline"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "amazon_url"
    t.string   "lowest_amazon_price"
    t.string   "quantity_new"
    t.string   "salesrank"
    t.float    "profit"
    t.float    "profit_margin"
    t.string   "mediumImage"
    t.string   "productUrl"
    t.string   "amazon_image"
  end

  create_table "saved_items", force: :cascade do |t|
    t.string   "name"
    t.float    "salePrice"
    t.string   "upc"
    t.string   "stock"
    t.boolean  "availableOnline"
    t.string   "amazon_url"
    t.string   "lowest_amazon_price"
    t.string   "quantity_new"
    t.string   "salesrank"
    t.float    "profit"
    t.float    "profit_margin"
    t.string   "mediumImage"
    t.string   "productUrl"
    t.string   "amazon_image"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "saved_items", ["user_id"], name: "index_saved_items_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "email"
    t.string   "name"
    t.string   "token"
    t.string   "refresh_token"
    t.integer  "expires_at"
    t.boolean  "expires"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "saved_items", "users"
end
