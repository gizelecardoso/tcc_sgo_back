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

ActiveRecord::Schema.define(version: 2021_06_03_034204) do

  create_table "activities", force: :cascade do |t|
    t.string "activity_code"
    t.string "activity_name"
    t.string "activity_description"
    t.date "expected_initial_date"
    t.date "expected_final_date"
    t.date "initial_date"
    t.date "final_date"
    t.date "stopped_date"
    t.string "activity_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "official_id"
    t.float "evolution"
    t.string "reason_to_stop"
    t.index ["official_id"], name: "index_activities_on_official_id"
  end

  create_table "activity_items", force: :cascade do |t|
    t.string "item_name"
    t.string "item_status"
    t.integer "activity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "finished_date"
    t.index ["activity_id"], name: "index_activity_items_on_activity_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_code"
    t.string "company_name"
    t.string "company_branch"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "officials", force: :cascade do |t|
    t.string "official_code"
    t.string "official_name"
    t.string "login_name"
    t.string "cellphone"
    t.string "password_digest"
    t.integer "role_id"
    t.integer "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "clerk_id"
    t.index ["company_id"], name: "index_officials_on_company_id"
    t.index ["role_id"], name: "index_officials_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_code"
    t.string "role_name"
    t.string "role_category"
    t.text "role_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "activities", "officials"
  add_foreign_key "activity_items", "activities"
  add_foreign_key "officials", "companies"
  add_foreign_key "officials", "roles"
end
