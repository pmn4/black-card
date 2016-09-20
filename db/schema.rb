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

ActiveRecord::Schema.define(version: 20160920205912) do

  create_table "actions", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "action_type",    limit: 255
    t.text     "params_json",    limit: 65535
    t.integer  "application_id", limit: 4
    t.integer  "user_id",        limit: 4
  end

  add_index "actions", ["application_id"], name: "index_actions_on_application_id", using: :btree
  add_index "actions", ["user_id"], name: "index_actions_on_user_id", using: :btree

  create_table "applications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name",           limit: 255
    t.string   "description",    limit: 255
    t.integer  "application_id", limit: 4
  end

  add_index "rewards", ["application_id"], name: "index_rewards_on_application_id", using: :btree

  create_table "rules", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "application_id", limit: 4
    t.string   "action_type",    limit: 255
    t.integer  "reward_id",      limit: 4
  end

  add_index "rules", ["application_id"], name: "index_rules_on_application_id", using: :btree
  add_index "rules", ["reward_id"], name: "index_rules_on_reward_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "application_id", limit: 4
  end

  add_index "users", ["application_id"], name: "index_users_on_application_id", using: :btree

  add_foreign_key "actions", "applications"
  add_foreign_key "actions", "users"
  add_foreign_key "rewards", "applications"
  add_foreign_key "rules", "rewards"
  add_foreign_key "users", "applications"
end
