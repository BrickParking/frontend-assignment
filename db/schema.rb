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

ActiveRecord::Schema.define(version: 20171213152916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "merk"
    t.string   "handelsbenaming"
    t.string   "voertuigsoort"
    t.string   "eerste_kleur"
    t.integer  "aantal_zitplaatsen"
    t.integer  "catalogusprijs"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "license_plate"
    t.string   "image_url"
    t.index ["license_plate"], name: "index_vehicles_on_license_plate", unique: true, using: :btree
    t.index ["user_id"], name: "index_vehicles_on_user_id", using: :btree
  end

  add_foreign_key "vehicles", "users"
end
