# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_01_11_012417) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "credits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "exploit_id", null: false
    t.bigint "hacker_id", null: false
    t.datetime "updated_at", null: false
    t.index ["exploit_id", "hacker_id"], name: "index_credits_on_exploit_id_and_hacker_id", unique: true
    t.index ["exploit_id"], name: "index_credits_on_exploit_id"
    t.index ["hacker_id"], name: "index_credits_on_hacker_id"
  end

  create_table "exploits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "cve_id"
    t.date "date_discovered", null: false
    t.text "description"
    t.integer "impact_level", default: 0, null: false
    t.string "media_url"
    t.bigint "platform_id", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["cve_id"], name: "index_exploits_on_cve_id"
    t.index ["date_discovered"], name: "index_exploits_on_date_discovered"
    t.index ["impact_level"], name: "index_exploits_on_impact_level"
    t.index ["platform_id"], name: "index_exploits_on_platform_id"
  end

  create_table "hackers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "handle", null: false
    t.boolean "team", default: false
    t.datetime "updated_at", null: false
    t.index ["handle"], name: "index_hackers_on_handle", unique: true
  end

  create_table "platforms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "generation"
    t.string "manufacturer"
    t.string "name", null: false
    t.date "release_date"
    t.string "slug", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_platforms_on_slug", unique: true
  end

  add_foreign_key "credits", "exploits"
  add_foreign_key "credits", "hackers"
  add_foreign_key "exploits", "platforms"
end
