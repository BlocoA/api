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

ActiveRecord::Schema[7.0].define(version: 2022_05_26_004153) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "condominium_users", force: :cascade do |t|
    t.bigint "condominium_id", null: false
    t.bigint "user_id", null: false
    t.integer "user_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condominium_id"], name: "index_condominium_users_on_condominium_id"
    t.index ["user_id"], name: "index_condominium_users_on_user_id"
  end

  create_table "condominiums", force: :cascade do |t|
    t.string "name", null: false
    t.integer "units_quantity"
    t.boolean "has_leisure_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residents", force: :cascade do |t|
    t.bigint "unit_id", null: false
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_residents_on_unit_id"
    t.index ["user_id"], name: "index_residents_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.bigint "condominium_id", null: false
    t.string "identifier", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condominium_id"], name: "index_units_on_condominium_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "condominium_users", "condominiums"
  add_foreign_key "condominium_users", "users"
  add_foreign_key "residents", "units"
  add_foreign_key "residents", "users"
  add_foreign_key "units", "condominiums"
end
