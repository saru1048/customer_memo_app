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

ActiveRecord::Schema[8.1].define(version: 2026_07_01_063229) do
  create_table "consultations", force: :cascade do |t|
    t.integer "consultation_type"
    t.datetime "consulted_at"
    t.datetime "created_at", null: false
    t.text "current_situation"
    t.integer "customer_id", null: false
    t.text "next_action"
    t.date "next_action_due_on"
    t.text "proposal"
    t.text "request"
    t.integer "status"
    t.text "summary"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["customer_id"], name: "index_consultations_on_customer_id"
    t.index ["user_id"], name: "index_consultations_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "memo"
    t.string "name"
    t.string "name_kana"
    t.string "phone_number"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "employee_number", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.datetime "remember_created_at"
    t.datetime "updated_at", null: false
    t.index ["employee_number"], name: "index_users_on_employee_number", unique: true
  end

  add_foreign_key "consultations", "customers"
  add_foreign_key "consultations", "users"
end
