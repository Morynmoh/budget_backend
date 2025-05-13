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

ActiveRecord::Schema[8.0].define(version: 2025_05_13_131450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.decimal "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budgetts", force: :cascade do |t|
    t.decimal "amount"
    t.date "date"
    t.string "description"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_budgetts_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.decimal "monthly_budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "category_id", null: false
    t.decimal "amount"
    t.date "date"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_expenses_on_account_id"
    t.index ["category_id"], name: "index_expenses_on_category_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.decimal "amount"
    t.date "date"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_incomes_on_account_id"
  end

  create_table "investments", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "investment_type"
    t.decimal "amount"
    t.date "date"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_investments_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "budgetts", "categories"
  add_foreign_key "expenses", "accounts"
  add_foreign_key "expenses", "categories"
  add_foreign_key "incomes", "accounts"
  add_foreign_key "investments", "accounts"
end
