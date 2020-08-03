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

ActiveRecord::Schema.define(version: 20200413191831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id",   null: false
  end

  add_index "authors_books", ["author_id", "book_id"], name: "index_authors_books_on_author_id_and_book_id", unique: true, using: :btree

  create_table "boiler_houses", force: :cascade do |t|
    t.string   "bhname",               null: false
    t.text     "phones_of_operators",  null: false
    t.string   "address",              null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "water_intake_unit_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "boiler_houses", ["water_intake_unit_id"], name: "index_boiler_houses_on_water_intake_unit_id", using: :btree

  create_table "boiler_houses_transformer_substations", id: false, force: :cascade do |t|
    t.integer "boiler_house_id",           null: false
    t.integer "transformer_substation_id", null: false
  end

  add_index "boiler_houses_transformer_substations", ["boiler_house_id", "transformer_substation_id"], name: "idx_boiler_transformer", unique: true, using: :btree

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
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "houses", force: :cascade do |t|
    t.string   "type_of_building",          null: false
    t.integer  "number_of_floors",          null: false
    t.integer  "year_of_construction",      null: false
    t.string   "type_of_roof",              null: false
    t.integer  "number_of_entrances",       null: false
    t.integer  "number_of_apartments"
    t.integer  "number_of_residents"
    t.string   "gasified"
    t.boolean  "basement"
    t.boolean  "attic"
    t.boolean  "underground_parking"
    t.boolean  "elevators"
    t.boolean  "garbage_chute"
    t.integer  "managment_company_id"
    t.integer  "boiler_house_id"
    t.integer  "transformer_substation_id"
    t.integer  "water_intake_unit_id"
    t.string   "address",                   null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "houses", ["boiler_house_id"], name: "index_houses_on_boiler_house_id", using: :btree
  add_index "houses", ["managment_company_id"], name: "index_houses_on_managment_company_id", using: :btree
  add_index "houses", ["transformer_substation_id"], name: "index_houses_on_transformer_substation_id", using: :btree
  add_index "houses", ["water_intake_unit_id"], name: "index_houses_on_water_intake_unit_id", using: :btree

  create_table "managment_companies", force: :cascade do |t|
    t.string   "mcname",              null: false
    t.string   "director",            null: false
    t.text     "phones_of_operators", null: false
    t.text     "phones_of_director"
    t.string   "address",             null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "role_users", force: :cascade do |t|
    t.integer  "role_id",    null: false
    t.integer  "user_id",    null: false
    t.json     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "role_users", ["role_id"], name: "index_role_users_on_role_id", using: :btree
  add_index "role_users", ["user_id"], name: "index_role_users_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "info",       null: false
    t.text     "full_info",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["info"], name: "index_roles_on_info", unique: true, using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "shopping_centers", force: :cascade do |t|
    t.string   "address",                   null: false
    t.string   "scname",                    null: false
    t.text     "owner"
    t.integer  "number_of_floors"
    t.string   "type_of_roof"
    t.integer  "number_of_entrances"
    t.integer  "maximum_working_shift"
    t.boolean  "basement"
    t.boolean  "attic"
    t.boolean  "underground_parking"
    t.boolean  "elevator"
    t.integer  "boiler_house_id"
    t.integer  "transformer_substation_id"
    t.integer  "water_intake_unit_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "shopping_centers", ["boiler_house_id"], name: "index_shopping_centers_on_boiler_house_id", using: :btree
  add_index "shopping_centers", ["transformer_substation_id"], name: "index_shopping_centers_on_transformer_substation_id", using: :btree
  add_index "shopping_centers", ["water_intake_unit_id"], name: "index_shopping_centers_on_water_intake_unit_id", using: :btree

  create_table "social_objects", force: :cascade do |t|
    t.string   "soname",                    null: false
    t.string   "type_of",                   null: false
    t.string   "director",                  null: false
    t.text     "superior_organization"
    t.text     "phones_of_operators",       null: false
    t.text     "phones_of_director"
    t.integer  "maximum_working_shift"
    t.boolean  "attic"
    t.boolean  "basement"
    t.boolean  "elevators"
    t.boolean  "redundant_power_supply"
    t.integer  "boiler_house_id"
    t.integer  "transformer_substation_id"
    t.integer  "water_intake_unit_id"
    t.string   "address",                   null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "social_objects", ["boiler_house_id"], name: "index_social_objects_on_boiler_house_id", using: :btree
  add_index "social_objects", ["transformer_substation_id"], name: "index_social_objects_on_transformer_substation_id", using: :btree
  add_index "social_objects", ["water_intake_unit_id"], name: "index_social_objects_on_water_intake_unit_id", using: :btree

  create_table "transformer_substations", force: :cascade do |t|
    t.integer  "tsnum",               null: false
    t.text     "phones_of_operators", null: false
    t.string   "address",             null: false
    t.string   "power_supply_center"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "transformer_substations_water_intake_units", id: false, force: :cascade do |t|
    t.integer "transformer_substation_id", null: false
    t.integer "water_intake_unit_id",      null: false
  end

  add_index "transformer_substations_water_intake_units", ["transformer_substation_id", "water_intake_unit_id"], name: "idx_transformer_water", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.date     "birthday"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "water_intake_units", force: :cascade do |t|
    t.integer  "wiunum",              null: false
    t.text     "phones_of_operators", null: false
    t.string   "address",             null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_foreign_key "boiler_houses", "water_intake_units"
  add_foreign_key "houses", "boiler_houses"
  add_foreign_key "houses", "managment_companies"
  add_foreign_key "houses", "transformer_substations"
  add_foreign_key "houses", "water_intake_units"
  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
  add_foreign_key "shopping_centers", "boiler_houses"
  add_foreign_key "shopping_centers", "transformer_substations"
  add_foreign_key "shopping_centers", "water_intake_units"
  add_foreign_key "social_objects", "boiler_houses"
  add_foreign_key "social_objects", "transformer_substations"
  add_foreign_key "social_objects", "water_intake_units"
end
