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

ActiveRecord::Schema.define(version: 20170603120631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.string   "phone"
    t.integer  "price"
    t.integer  "district_id"
    t.string   "offer_id"
    t.string   "tipologia"
    t.text     "description"
    t.string   "image_path"
    t.string   "location"
    t.datetime "publicated_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "search_link_id", null: false
    t.index ["district_id"], name: "index_ads_on_district_id", using: :btree
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_links", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "site_id"
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["district_id"], name: "index_search_links_on_district_id", using: :btree
    t.index ["site_id"], name: "index_search_links_on_site_id", using: :btree
  end

  create_table "sites", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ads", "districts"
  add_foreign_key "search_links", "districts"
  add_foreign_key "search_links", "sites"
end
