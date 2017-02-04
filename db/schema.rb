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

ActiveRecord::Schema.define(version: 20170204124339) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["street"], name: "index_addresses_on_street", unique: true

  create_table "buyers", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "buyers", ["name"], name: "index_buyers_on_name", unique: true

  create_table "products", force: :cascade do |t|
    t.text     "description",                          null: false
    t.decimal  "item_price",  precision: 10, scale: 2, null: false
    t.integer  "supplier_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.integer  "quantity",                             null: false
    t.text     "description",                          null: false
    t.decimal  "item_price",  precision: 10, scale: 2, null: false
    t.integer  "buyer_id",                             null: false
    t.integer  "product_id",                           null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "suppliers", ["name"], name: "index_suppliers_on_name", unique: true

end
