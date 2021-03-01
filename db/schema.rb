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

ActiveRecord::Schema.define(version: 2021_03_01_233627) do

  create_table "admins", force: :cascade do |t|
    t.integer "official_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["official_id"], name: "index_admins_on_official_id"
  end

  create_table "clerks", force: :cascade do |t|
    t.integer "company_id"
    t.integer "official_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_clerks_on_company_id"
    t.index ["official_id"], name: "index_clerks_on_official_id"
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
    t.string "login_password"
    t.integer "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_officials_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_code"
    t.string "role_name"
    t.text "role_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workers", force: :cascade do |t|
    t.float "performance"
    t.integer "clerk_id"
    t.integer "official_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clerk_id"], name: "index_workers_on_clerk_id"
    t.index ["official_id"], name: "index_workers_on_official_id"
  end

  add_foreign_key "admins", "officials"
  add_foreign_key "clerks", "companies"
  add_foreign_key "clerks", "officials"
  add_foreign_key "officials", "roles"
  add_foreign_key "workers", "clerks"
  add_foreign_key "workers", "officials"
end