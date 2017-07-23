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

ActiveRecord::Schema.define(version: 20170723045630) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "super_admin",            default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password_digest",                        null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "owner_type"
    t.integer  "owner_id",     null: false
    t.string   "access_token"
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["owner_type", "owner_id"], name: "index_api_keys_on_owner_type_and_owner_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "entries", force: :cascade do |t|
    t.integer  "feed_id"
    t.text     "entries_url"
    t.text     "image_url"
    t.string   "title"
    t.string   "content"
    t.string   "author"
    t.datetime "published"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "admin_id"
    t.integer  "category"
    t.index ["admin_id"], name: "index_entries_on_admin_id", using: :btree
    t.index ["feed_id"], name: "index_entries_on_feed_id", using: :btree
  end

  create_table "feeds", force: :cascade do |t|
    t.string   "name"
    t.text     "url"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "admin_id"
    t.index ["admin_id"], name: "index_feeds_on_admin_id", using: :btree
  end

  create_table "incomes", force: :cascade do |t|
    t.decimal  "nominal",                          null: false
    t.datetime "transaction_time",                 null: false
    t.integer  "wallet_id",                        null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "description"
    t.json     "photos"
    t.string   "currency",         default: "IDR", null: false
    t.integer  "income_type",                      null: false
    t.boolean  "classification"
    t.index ["wallet_id"], name: "index_incomes_on_wallet_id", using: :btree
  end

  create_table "spendings", force: :cascade do |t|
    t.decimal  "nominal",                        null: false
    t.datetime "spending_time",                  null: false
    t.integer  "wallet_id",                      null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "description"
    t.json     "photos"
    t.string   "currency",       default: "IDR", null: false
    t.integer  "spending_type",                  null: false
    t.boolean  "classification"
    t.index ["wallet_id"], name: "index_spendings_on_wallet_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.string   "full_name",              default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password_digest",                        null: false
    t.boolean  "email_confirmed",        default: false
    t.date     "birthday"
    t.integer  "gender"
    t.string   "city"
    t.string   "profile_picture"
    t.string   "phone_number"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wallet_settings", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "wallet_id"
    t.integer  "save_plan",        default: 0
    t.boolean  "active_save_plan"
    t.index ["wallet_id"], name: "index_wallet_settings_on_wallet_id", unique: true, using: :btree
  end

  create_table "wallets", force: :cascade do |t|
    t.string   "owner_type"
    t.integer  "owner_id",                     null: false
    t.float    "wallet_balance", default: 0.0, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["owner_type", "owner_id"], name: "index_wallets_on_owner_type_and_owner_id", using: :btree
  end

  add_foreign_key "wallet_settings", "wallets"
end
